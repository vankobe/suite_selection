class Flavor < ActiveRecord::Base
  attr_accessible :name
  has_many :product_content

  validates :name, :presence => true
  validates :name, :length => {:max => 50}
end

