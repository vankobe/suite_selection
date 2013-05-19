class Provider < ActiveRecord::Base
  attr_accessible :country_id, :name, :price, :product_id, :url

  belongs_to :product
  belongs_to :country

  validates :country_id, :price, :name, :url, :presence => true
  validates :name, :length => {:maximum => 200}
  validates :url, :format => {:with => /^http(s)*:\/\//}
  validates_numericality_of :price, :less_than_or_equal_to => 1000000

  # money_rails
  monetize :price_cents, as: "price"
end
