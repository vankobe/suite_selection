class Flavor < ActiveRecord::Base
  attr_accessible :name
  has_many :product_content

  validates :name, :presence => true, :uniqueness => true
  validates :name, :length => {:maximum => 50}
end

