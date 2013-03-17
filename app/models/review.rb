class Review < ActiveRecord::Base
  attr_accessible :country_id, :language_id, :product_id, :score, :subject, :user_id
  has_one :review_content
  has_many :review_image

  SCORES = [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
end
