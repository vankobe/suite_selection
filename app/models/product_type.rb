class ProductType < ActiveRecord::Base
  attr_accessible :category_id, :name
  has_many :product_content, :foreign_key => "type_id"
  belongs_to :category, class_name: "ProductCategory"

  validates :category_id, :name, :presence => true
  validates :name, :length => {:maximum => 50}
end
