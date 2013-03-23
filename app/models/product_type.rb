class ProductType < ActiveRecord::Base
  attr_accessible :category_id, :name
  has_many :product_content, :foreign_key => "type_id"
end
