class ReviewContent < ActiveRecord::Base
  attr_accessible :comment, :review_id
  belongs_to :review

  validates :review_id, :comment, :presence => true
  validates :comment, :length => {:minimum => 100, :maximum => 1000}
end
