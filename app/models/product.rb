class Product < ActiveRecord::Base
  attr_accessible :country_id, :currency_id, :name, :price, :shop_id, :url

  has_many :contents, :class_name => "ProductContent", :include => ["type", "flavor"]
  belongs_to :shop, :include => ["state"]
  has_many :review, :include => ["content"], :order  => "id DESC"
  has_many :review_image, :order => "id DESC"

  validates :country_id, :currency_id, :name, :price, :shop_id, :url, :presence => true
  validates :name, :length => {:maximum => 200}
  validates :url, :format => {:with => /~http(s)*:\/\//}
  validates :price, :length => {:maximum => 8, :min => 2}
  
end
