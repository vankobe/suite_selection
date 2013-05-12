class Product < ActiveRecord::Base
  attr_accessible :country_id, :currency_id, :name, :price, :shop_id, :url

  # relation
  has_many :contents, :class_name => "ProductContent", :include => ["type", "flavor"]
  belongs_to :shop, :include => ["state"]
  has_many :reviews, :include => ["content"], :order  => "id DESC"
  has_many :review_images, :order => "id DESC"
  has_many :providers, :order => "price DESC"
  has_many :images, class_name: "ProductImage", order: "id DESC"

  # validation
  validates :name, :shop_id, :presence => true
  validates :name, :length => {:maximum => 200}


  # kaminari config
  default_scope :order => "products.updated_at DESC"
  paginates_per 10

  def image
    self.images.first
  end
end
