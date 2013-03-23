class Flavor < ActiveRecord::Base
  attr_accessible :name
  has_many :product_content
end

