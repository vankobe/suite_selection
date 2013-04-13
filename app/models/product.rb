class Product < ActiveRecord::Base
  attr_accessible :country_id, :currency_id, :name, :price, :shop_id, :url

  # relation
  has_many :contents, :class_name => "ProductContent", :include => ["type", "flavor"]
  belongs_to :shop, :include => ["state"]
  has_many :review, :include => ["content"], :order  => "id DESC"
  has_many :review_image, :order => "id DESC"
  has_many :provider, :order => "price DESC"

  # validation
  validates :name, :shop_id, :presence => true
  validates :name, :length => {:maximum => 200}


  # kaminari config
  default_scope :order => "updated_at DESC"
  paginates_per 10
end
