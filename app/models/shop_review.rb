class ShopReview < ActiveRecord::Base
  attr_accessible :comment, :language_id, :shop_id, :subject, :user_id
  has_many :images, :class_name => "ShopReviewImage", :foreign_key => 'review_id'
  
  validates :shop_id, :user_id, :language_id, :subject, :comment, :presence => true
  validates :subject, :length => {:max => 100}
  validates :comment, :length => {:min => 100 ,:max => 10000}
end
