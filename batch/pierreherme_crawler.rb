require 'nokogiri'
require 'open-uri'

class PierrehermeCrawler
  LOG_DIR = File.join(Rails.root, "log", "batch")
  IMAGE_BASE_URL = "http://www.pierreherme.co.jp"
  BASE_URL = "http://www.pierreherme.co.jp/onlineshopping/"
  MAX_TRY = 1000

  class << self
    def process
      # ログを設定
      set_logger

      # ショップを作成する
      shop = create_shop

      # 検査するurlの数
      (1..MAX_TRY).each do |i|
        url = BASE_URL + "?no=" + i.to_s
        doc = Nokogiri::HTML(open(url))
        if doc.css("div.spec dd").present?
          type_name = doc.css("div.pankuzu li a")[1].text.sub(/^(\w|\s|　)*/,"")
          # 例外を追加
          type_name = "チョコレート" if type_name == "ショコラ"
          type = ProductType.find_by_name(type_name)

          # typeかcategoryを設定する
          if type
            category = type.category
          else
            category = ProductCategory.find_by_name(type_name)
          end

          # categoryもtypeもなかったらログに出す
          if type.blank? && category.blank?
            log_element = [Time.now, type_name, url]
            @category_not_found_log.info log_element.join("\t")
            next
          end

          # 必要なDOMを取得
          title = doc.css("div.spec dt")
          info = doc.css("div.spec dd")
          image_url = doc.css("div.main-image img").attribute("src").value
          content_info = []
        
          begin
            Product.transaction do 
              # 要素取得
              product = Product.new
              provider = product.providers.build
              image = product.images.build

              title.each_with_index do |ele, j|
                # productの設定
                product.shop_id = shop.id    
                if ele.text == "品　　名"
                  product.name = info[j].children.text
                end
                if ele.text == "消費期限" || ele.text == "賞味期限"
                  product.expire_date = info[j].text # 消費期限
                end

                # providerの設定
                if ele.text == "価　　格"
                  provider.price = info[j].text.gsub(",", "").gsub(/円.*/, "") #値段
                end
                provider.url = url
                provider.country_id = 1 # 日本
                provider.name = shop.name
                if ele.text == "在　　庫"
                  provider.on_sale_flg = !(info[j].text.include?("×")) # 在庫
                end
              
                if ele.text == "内　　容"
                  content_info = info[j].text.split("×各")
                end
              end
              puts i.to_s + "件目"
              # リランできるように保存しない条件
              skip_product = Product.find_by_name(product.name)
              if skip_product.present? && skip_product.providers.present? && skip_product.providers.map(&:url).include?(url)
                # 在庫のみ更新
                provider.save(validate: false)
              else
                product.save(validate: false)
                provider.save(validate: false)
 
                # product_contentの設定
                contents = []
                content_info.each_with_index do |s, i|
                  if i.even?
                    s.split("、").each do |name|
                      unless name.include?("了承") || name.include?("異なり")
                        contents << product.contents.build(name: name)
                      end
                    end
                  else
                    contents.each do |content|
                      content.type_id = type.try(:id)
                      content.category_id = category.try(:id)
                      content.quantity = s.to_i
                      content.save(validate: false)
                    end
                  end
                end

                # product_imageの設定
                image_file = open(IMAGE_BASE_URL + image_url)
                image.product_image = image_file.read
                image.save!
              end
            end
          rescue => e
            p url
            p e.inspect
            p e.backtrace
            raise
          end
        end
      end
    end

private
    # ショップを作成する
    def create_shop
      if shop = Shop.find_by_name("PIERRE HERME PARIS")
        # 既にあれば何もしない
      else
        shop = Shop.new
        shop.home_url   = "http://www.pierreherme.co.jp/boutiques/"
        shop.online_url = BASE_URL
        shop.country_id = 1 # 日本
        shop.state_id   = State.find_by_name("東京都").try(:id)
        shop.address    = "〒150-0001 東京都渋谷区神宮前5-51-8 ラ・ポルト青山1・2F"
        shop.name       = "PIERRE HERME PARIS"
        shop.save!
        image = shop.images.build
        image_file = open("http://www.pierreherme.co.jp/boutiques/img/aoyama.jpg")
        image.shop_image = image_file.read
        image.save!
      end
      shop
    end

    # Loggerの設定
    def set_logger
      FileUtils.mkdir_p(LOG_DIR) unless FileTest.exist?(LOG_DIR)
      @category_not_found_log = Logger.new(File.join(LOG_DIR, "category_not_found.log"))
    end
  end
end
PierrehermeCrawler.process
