class ShopReview < ActiveRecord::Base
  attr_accessible :comment, :language_id, :shop_id, :subject, :user_id
  has_many :images, :class_name => "ShopReviewImage", :foreign_key => 'review_id'
  
  validates :shop_id, :user_id, :language_id, :subject, :comment, :presence => true
  validates :subject, :length => {:maximum => 100}
  validates :comment, :length => {:minimum => 100 ,:maximum => 10000}
end
