class Shop < ActiveRecord::Base
  attr_accessible :address, :country_id, :home_url, :latitude, :longitude, :name, :online_url, :score, :state_id
  has_many :product
  belongs_to :state
  has_many :shop_review, :order => "id DESC"
  has_many :images, :class_name => "ShopReviewImage", :order => "id DESC"
  belongs_to :country
  
  validates :country_id, :name, :state_id, :presence => true
  validates :name, :length => {:maximum => 200}
  validates :home_url, :online_url, :format => {:with => /^http(s)*:\/\//}
end
