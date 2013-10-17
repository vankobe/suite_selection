class InsertSuggestKeywords
  class << self
    require "kakasi"
    require "nkf"
    include Kakasi
    def process
      SuggestKeyword.delete_all
        products = Product.all
        shops = Shop.all
	i = 0
        SuggestKeyword.transaction do 
        products.each do |product|
	  keyword = SuggestKeyword.where(["display_name = ?", product.name])
	  product_name = product.name
	  if keyword.present?
	    product_name = product.name + i.to_s
	    i += 1
	  end
          SuggestKeyword.create({:type => "Product", :type_id => product.id, :display_name => product_name, :name => product_name, :name_yomi => kakasi("-Ea -Ja -Ha -Ka", NKF.nkf("-e", product_name))})
        end
        shops.each do |shop|
	  shop_name = shop.name
	  keyword = SuggestKeyword.where(["display_name = ?", shop.name])
	  if keyword.present?
	    shop_name = shop.name + i
	    i += 1
	  end
          SuggestKeyword.create({:type => "Product", :type_id => shop.id, :display_name => shop_name, :name => shop_name, :name_yomi => kakasi("-Ea -Ja -Ha -Ka", NKF.nkf("-e", shop_name))})
        end
      end
    end
  end
end
InsertSuggestKeywords.process
