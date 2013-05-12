class ProductImage < ActiveRecord::Base
  attr_accessible :product_id, :product_image
  belongs_to :product

  validates :product_id, :presence => true
  image_accessor :product_image
end
