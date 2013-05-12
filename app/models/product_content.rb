class ProductContent < ActiveRecord::Base
  attr_accessible :category_id, :flavor_id, :product_id, :quantity, :type_id
  belongs_to :product
  belongs_to :category, :class_name => "ProductCategory"
  belongs_to :type, :class_name => "ProductType"
  belongs_to :flavor

  validates :category_id, :flavor_id, :product_id, :quantity, :type_id, :presence => true
  validates_numericality_of :quantity, :less_than_or_equal_to => 10000

  def category_name
    MasterTable::Category::NAME[self.category_id]
  end
end
