class ShopImage < ActiveRecord::Base
  attr_accessible :shop_id, :shop_image_name, :shop_image_uid, :shop_image
  belongs_to :shop

  image_accessor :shop_image
end
