class ShopJp < ActiveRecord::Base
  attr_accessible :city_id, :country_id, :image_path, :latitude, :long_desc, :longitude, :name, :prefecture_id, :shop_id, :short_desc
end
