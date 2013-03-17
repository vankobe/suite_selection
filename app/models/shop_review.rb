class ShopReview < ActiveRecord::Base
  attr_accessible :comment, :language_id, :shop_id, :subject, :user_id
  has_many :images, :class_name => "ShopReviewImage", :foreign_key => 'review_id'
end
