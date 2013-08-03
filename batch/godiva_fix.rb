class GodivaFix
  class << self
    def process
      products = Product.all
        products.each do |product|
	  if product.name.present? 
            product.name = product.name.to_s.gsub(/ゴディバ（GODIVA）/, "")
	    if product.name =~ /【送料込】/
              product.name = product.name.to_s.gsub(/【送料込】/, "")
	      free_postage_flg = true
	    end
	  end
	  if product.expire_date.present?
            product.expire_date = product.expire_date.to_s.gsub(/＜賞味期限＞/, "")
	  end
          product.save(validate: false)
	  provider = product.providers.first
	  provider.free_postage_flg = free_postage_flg
	  provider.save(validate: false)
        end
    end
  end
end
GodivaFix.process
