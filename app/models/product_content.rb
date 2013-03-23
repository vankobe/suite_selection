class ProductContent < ActiveRecord::Base
  attr_accessible :category_id, :flavor_id, :product_id, :quantity, :type_id
  belongs_to :product
  belongs_to :type, :class_name => "ProductType"
  belongs_to :flavor

  def category_name
    MasterTable::Category::NAME[self.category_id]
  end
end
