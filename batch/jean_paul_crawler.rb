require 'nokogiri'
require 'open-uri'
#TODO http://www.jph-japon.co.jp/shop/detail-000506.html 内容とカテゴリ

class JeanPaulCrawler < Batch::Base
  LOG_DIR = File.join(Rails.root, "log", "batch")
  IMAGE_BASE_URL = "http://www.jph-japon.co.jp"
  BASE_URL = "http://www.jph-japon.co.jp/shop/"
  MAX_TRY = 1000
  EXTRACT_WORD = ["カップアイス", "タルトグラッセ", "アイスクリームトリュフ", "トリュフ", "タブレット", "カレ", "フルーツトリュフ"]

  class << self
    include ActionView::Helpers::TextHelper
    def process
      # ログを設定
      set_logger

      # ショップを作成する
      shop = create_shop
      
      # 在庫ありを初期化
      Provider.update_all("on_sale_flg = 0", ["url like ?", BASE_URL + "%"])

      # 検査するurlの数
      (1..MAX_TRY).each do |i|
        url = BASE_URL + "detail-" + sprintf("%06d", i) + ".html"
        doc = Nokogiri::HTML(open(url))
        #p doc.css("td.shp h4").text # 英名
        #p doc.css("td.shp small").text # 和名
        #p doc.css("div.price").text.gsub(/(\"|円.*)/, "") # 値段
        #p doc.xpath('//img[@id="target"]/@src').first.value # 値段


        if doc.css("td.shp small").present?
          title = doc.css("td.shp small").text
          type_name = type_selecter(title)
          
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
            puts title
            puts "#{i}件目: #{url}"
            next
          end

          # 必要なDOMを取得
          #content_info = doc.css("div.mainshopgoodsleft p")
          image_url = doc.xpath('//img[@id="target"]/@src').first.value
        
          begin
            Product.transaction do 
              # 要素取得
              product = Product.new
              provider = product.providers.build
              image = product.images.build
              product.shop_id = shop.id    
              product.name = title
              if doc.css("td.shp p").text =~ /(賞味期限|消費期限).*\s(.*)\s/
                product.expire_date = $2
              end
                # providerの設定
                provider.price = doc.css("div.price").text.gsub(/(\"|円.*)/, "")
                provider.url = url
                provider.country_id = 1 # 日本
                provider.name = shop.name
                provider.on_sale_flg = true unless title =~ /(完売|待ち|きれ|切れ|まち)/
              puts i.to_s + "件目"
              # リランできるように保存しない条件
              skip_provider = Provider.find_by_url(url)
              if skip_provider.present?
                skip_provider.on_sale_flg= true unless title =~ /(完売|待ち|きれ|切れ|まち)/
                skip_provider.save(validate: false)
              else
                product.save(validate: false)
                provider.save(validate: false)
 
                if doc.css("td.exp p").text.present?
                  review = product.reviews.build
                  review_content = review.build_content
                  review.user_id = 0
                  review.language_id = MasterTable::Language::JAPANESE
                  review_content.comment = doc.css("td.exp p").text                
                  review.subject = review.content.comment.truncate(35, :separater => "。")
                  review.save!
                  review_content.save(validate: false)
                end
                # product_contentの設定
                if doc.css("td.exp p").text =~ /内容/
                  content_info = doc.css("td.exp p")
                  content_info.each do |content_text|
                    if content_text.text =~ /内容/
                      contents = content_text.text.gsub(/(\(|（).*/, "").split("<br>")
                      contents.each do |content|
                        product_content = product.contents.build
                        product_content.name = content.split(/(×|　)/)[0]
                        product_content.type_id = type.try(:id)
                        product_content.category_id = category.try(:id)
                        product_content.quantity = content.split(/(×|　)/)[1]
                      end
                    end
                  end
                else
                  content = product.contents.build
                  content.name = title
                  if title =~ /#{"("+EXTRACT_WORD.join("|")+")"}(\s|　)*(.*(\s|　)*.*)(\s|　)(.*)$/ # $3: flavor, $6: 数量
                    if $6 =~ /個/
                      flavor_name = $3
                    else
                      flavor_name = $3.to_s + " " + $6.to_s
                    end
                    flavor = Flavor.find_by_name(flavor_name)
                    flavor = Flavor.create({name: flavor_name}) if flavor.blank?
                    content.flavor_id = flavor.id
                  end
                  title =~ /(\d*)個/
                  content.type_id = type.try(:id)
                  content.category_id = category.try(:id)
                  content.quantity = $1 || 1
                  content.save(validate: false)
                end

                # product_imageの設定
                image_file = open(image_url)
                image.product_image = image_file.read
                image.save!
                sleep 2 if i%10 == 0
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
      if shop = Shop.find_by_name("JEAN-PAUL HÉVIN")
        # 既にあれば何もしない
      else
        shop = Shop.new
        shop.home_url   = IMAGE_BASE_URL
        shop.online_url = BASE_URL
        shop.country_id = 1 # 日本
        shop.state_id   = State.find_by_name("パリ").try(:id)
        shop.address    = "23 bis, avenue de la Motte-Picquet 75007 Paris"
        shop.name       = "JEAN-PAUL HÉVIN"
        shop.save(validate: false)
        image = shop.images.build
        image_file = open("http://www.jph-japon.co.jp/shoplist/motte_picquet/img/main.jpg")
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
JeanPaulCrawler.process
