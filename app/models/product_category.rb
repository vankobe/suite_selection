class ProductCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :contents, class_name: "ProductContent"
  has_many :types, class_name: "ProductType"
end
