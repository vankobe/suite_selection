require 'nokogiri'
require 'open-uri'

class GodivaCrawler
  LOG_DIR = File.join(Rails.root, "log", "batch")
  IMAGE_BASE_URL = "http://www.godiva.co.jp/"
  BASE_URL = "http://www.godiva.co.jp/onlineshop/ItemDetail"
  MAX_TRY = 500
  EXTRACT_WORD = ["カップアイス", "タルトグラッセ", "アイスクリームトリュフ", "トリュフ", "タブレット", "カレ", "フルーツトリュフ"]

  class << self
    def process
      # ログを設定
      set_logger

      # ショップを作成する
      shop = create_shop
      
      # 在庫ありを初期化
      Provider.update_all("on_sale_flg = 0", ["url like ?", BASE_URL + "%"])

      # 検査するurlの数
      (1..MAX_TRY).each do |i|
        url = BASE_URL + "?cmId=" + i.to_s
        doc = Nokogiri::HTML(open(url))
        if doc.css("div.mainshopgoodsright").present?
          title = doc.css("div.mainshopgoodsright").text
          case
          when title.include?("アイスクリーム")
            type_name = "アイスクリーム"
          when title.include?("タルトグラッセ")
            type_name = "クッキーアイス"
          when title.include?("トリュフ") || title.include?("ゴールド") || title.include?("グランプラス") || title.include?("ラッピング")
            type_name = "トリュフ"
          when title.include?("カレ")
            type_name = "カレ"
          when title.include?("タブレット")
            type_name = "タブレット"
          when title.include?("ミントスティック") || title.include?("オランジェ")
            type_name = "グルマンディ"
          when title.include?("クッキー")
            type_name = "クッキー"
          when title.include?("ビスキュイ")
            type_name = "ビスキュイ"
          end
          
          if doc.css("div.mainshopcategoryright").present?
            category = doc.css("div.mainshopcategoryright h2 img alt").text
            if category.include?("ビスキュイ") 
              type_name = "ビスキュイ"
            end
          end
          type = ProductType.find_by_name(type_name)

          # typeかcategoryを設定する
          if type
            category = type.category
          else
            category = ProductCategory.find_by_name(type_name)
          end

          # categoryもtypeもなかったらログに出す
          if type.blank? && category.blank?
            log_element = [Time.now, title, type_name, url]
            @category_not_found_log.info log_element.join("\t")
            puts "#{i}件目: #{url}"
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
                provider.on_sale_flg = true
              end 
              puts i.to_s + "件目"
              # リランできるように保存しない条件
              skip_product = Product.find_by_name(product.name)
              if skip_product.present? && skip_product.providers.present? && skip_product.providers.map(&:url).include?(url)
                skip_provider = Provider.find_by_url(url)
                skip_provider.on_sale_flg= true
                skip_provider.save(validate: false)
              else
                product.save(validate: false)
                provider.save(validate: false)

                if doc.css("div.mainshopgoodsright p")[2].text.present?
                  review = product.reviews.build
                  review_content = review.build_content
                  review.user_id = 0
                  review.language_id = MasterTable::Language::JAPANESE
                  review_content.comment = doc.css("div.mainshopgoodsright p")[2].text
                  review.subject = review.content.comment.truncate(35, :separater => "。")
                  review.save!
                  review_content.save(validate: false)
                end
 
                # product_contentの設定
                content_info.each_with_index do |ele|
                  content = product.contents.build
                  content.name = ele.text.split("×")[0].strip
                  flavor_name = content.name.gsub(/#{"("+EXTRACT_WORD.join("|")+")"}(\s|　)*/,"")
                  flavor = Flavor.find_by_name(flavor_name)
                  flavor = Flavor.create({name: flavor_name}) if flavor.blank?
                  content.flavor_id = flavor.id
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
