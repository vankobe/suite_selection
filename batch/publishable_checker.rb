class PublishableChecker
  class << self
    LOG_DIR = File.join(Rails.root, "log", "batch")
    def process
      # Loggerを設定する
      set_logger

      # オプションを設定する
      set_options 

      # 対象のProductを取ってくる. idsオプションがついていれば、設定されたidのみ。そうでなければすべてのProducts
      products = get_products

      # published_flgを0に戻す
      products.each{|product| product.update_attribute(:published_flg, 0)} if @options["rerun"]

      # published_flgを1にして保存を試みる
      success_count, failed_count = publishing_process(products)

      # 結果を表示
      @log.info "成功: #{success_count}"
      @log.info "失敗: #{failed_count}"
      p "成功: #{success_count}"
      p "失敗: #{failed_count}"
    end

private
    def set_options
      @options = {}
      last_option = ""
      ARGV.each do |ele|
        if ele =~ /^-(.*)/
          @options[$1] = true
          last_option = $1
        else
          @options[last_option] = ele
        end
      end
    end

    def get_products
      if @options["ids"]
        products = Product.where(["id in (?)", ids])
      else
        products = Product.all
      end
      products
    end
  
    def publishing_process(products)
      success_count = 0
      failed_count = 0
      products.each do |product|
        begin
          Product.transaction do 
              product.publish!
              success_count += 1
          end 
        rescue
          failed_count += 1
        end
      end
      [success_count, failed_count]
    end

    # Loggerの設定
    def set_logger
      FileUtils.mkdir_p(LOG_DIR) unless FileTest.exist?(LOG_DIR)
      @log = Logger.new(File.join(LOG_DIR, "publishing.log"))
    end
  end
end
PublishableChecker.process
