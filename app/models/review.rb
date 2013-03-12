class Review < ActiveRecord::Base
  attr_accessible :country_id, :product_id, :score, :user_id
end
