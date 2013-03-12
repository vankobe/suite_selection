class Product < ActiveRecord::Base
  attr_accessible :country_id, :currency_id, :image_path, :price, :shop_id
end
