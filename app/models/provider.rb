class Provider < ActiveRecord::Base
  attr_accessible :country_id, :currency_id, :name, :price, :product_id, :url

  validates :country_id, :currency_id, :price, :name, :url, :presence => true
  validates :name, :length => {:maximum => 200}
  validates :url, :format => {:with => /^http(s)*:\/\//}
  validates_numericality_of :price, :less_than_or_equal_to => 1000000
end
