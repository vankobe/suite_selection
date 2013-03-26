class Product < ActiveRecord::Base
  attr_accessible :country_id, :currency_id, :name, :price, :shop_id, :url

  has_many :contents, :class_name => "ProductContent", :include => ["type", "flavor"]
  belongs_to :shop, :include => ["state"]
  has_many :review, :include => ["content"], :order  => "id DESC"
  has_many :review_image, :order => "id DESC"
  has_many :provider

  validates :name, :shop_id, :presence => true
  validates :name, :length => {:maximum => 200}
end
