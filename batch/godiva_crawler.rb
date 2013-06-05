require 'nokogiri'
require 'open-uri'

class GodivaCrawler
  LOG_DIR = File.join(Rails.root, "log", "batch")
  IMAGE_BASE_URL = "http://www.godiva.co.jp/"
  BASE_URL = "http://www.godiva.co.jp/onlineshop/ItemDetail"
  MAX_TRY = 1000

  class << self
    def process
      # ログを設定
      set_logger

      # ショップを作成する
      shop = create_shop

      # 検査するurlの数
      (1..MAX_TRY).each do |i|
        url = BASE_URL + "?cmId=" + i.to_s
        doc = Nokogiri::HTML(open(url))
        if doc.css("div.mainshopgoodsright").present?
          title = doc.css("div.mainshopgoodsright").text
          case
          when title.include?("アイスクリーム") || title.include?("タルトグラッセ")
            type_name = "アイスクリーム"
          when title.include?("トリュフ") || title.include?("ゴールド") || title.include?("グランプラス")
            type_name = "トリュフ"
          when title.include?("クッキー")
            type_name = "サブレ"
          end
          type = ProductType.find_by_name(type_name)
          #type_name = doc.css("div.pankuzu li a")[1].text.sub(/^(\w|\s|　)*/,"")
          # 例外を追加
          #type_name = "チョコレート" if type_name == "ショコラ"
          #type = ProductType.find_by_name(type_name)

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
          content_info = doc.css("div.mainshopgoodsleft p")
          image_url = doc.css("div#mainPict img").attribute("src").value
        
          begin
            Product.transaction do 
              # 要素取得
              product = Product.new
              provider = product.providers.build
              image = product.images.build
              infos = doc.css("div.mainshopgoodsright p.mainshopgoodsmargin25")
              product.shop_id = shop.id    
              product.name = doc.css("div.mainshopgoodsright h3 strong").text
              infos.each do |ele|
                if ele.text.include?("消費期限") || ele.text.include?("賞味期限")
                  product.expire_date = ele.text.gsub(/(\r|\n)/,"").gsub(/^.*<br>/,"")
                end

                # providerの設定
                if ele.text == "販売価格"
                  provider.price = ele.text.gsub(/^.*￥/, "").gsub(",", "").gsub(/\s\(.*/, "").strip #値段
                end
                provider.url = url
                provider.country_id = 1 # 日本
                provider.name = shop.name
              end 
              puts i.to_s + "件目"
              # リランできるように保存しない条件
              skip_product = Product.find_by_name(product.name)
              if skip_product.present? && skip_product.providers.present? && skip_product.providers.map(&:url).include?(url)
                # 何もしない
              else
                product.save(validate: false)
                provider.save(validate: false)
 
                # product_contentの設定
                content_info.each_with_index do |ele|
                  content = product.contents.build
                  content.name = ele.text.split("×")[0].strip
                  content.type_id = type.try(:id)
                  content.category_id = category.try(:id)
                  content.quantity = ele.text.split("×")[1].strip
                  content.save(validate: false)
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
      if shop = Shop.find_by_name("GODIVA")
        # 既にあれば何もしない
      else
        shop = Shop.new
        shop.home_url   = "http://www.godiva.co.jp/about/index.html"
        shop.online_url = BASE_URL
        shop.country_id = 1 # 日本
        shop.state_id   = State.find_by_name("ブリュッセル").try(:id)
        shop.address    = "Grand-Place 22  1000 Bruxelles, BELGIUM"
        shop.name       = "GODIVA"
        shop.save(validate: false)
        image = shop.images.build
        image_file = open("http://godiva.be/images/stories/banners/butt_home_store_en.png")
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
GodivaCrawler.process
