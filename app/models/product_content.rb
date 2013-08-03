class ProductContent < ActiveRecord::Base
  attr_accessible :category_id, :flavor_id, :product_id, :quantity, :type_id, :name
  belongs_to :product
  belongs_to :category, :class_name => "ProductCategory"
  belongs_to :type, :class_name => "ProductType"
  belongs_to :flavor

  validates :category_id, :flavor_id, :product_id, :quantity, :type_id, presence: true, if: :published?
  validates :category_id, presence: true
#  validates_numericality_of :quantity, :less_than_or_equal_to => 10000

  def published?
    self.product.try(:published?)
  end

  def category_name
    self.category.try(:name)
  end

  def flavor_name
    self.flavor.try(:name)
  end

  def type_name
    self.type.try(:name)
  end
end
