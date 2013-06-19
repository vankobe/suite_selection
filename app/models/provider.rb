class Provider < ActiveRecord::Base
  attr_accessible :country_id, :name, :price, :product_id, :url

  belongs_to :product
  belongs_to :country

  validates :product_id, :country_id, :presence => true
  validates :product_id, :country_id, :price_cents, :price_currency, :name, :url, :presence => true, if: :published?
  validates :name, :length => {:maximum => 200}, if: :published?
  validates :url, :format => {:with => /^http(s)*:\/\//}, if: :published?
  validates_numericality_of :price, :less_than_or_equal_to => 1000000, if: :published?
  validates_numericality_of :price, :more_than => 0, if: :published?

  # money_rails
  monetize :price_cents, as: "price"

  def country_name
    self.country.try(:name)
  end

  def published?
    self.product.try(:published?)
  end
end
