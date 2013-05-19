class Product < ActiveRecord::Base
  attr_accessible :country_id, :name, :shop_id, :url, :published_flg

  # relation
  has_many :contents, :class_name => "ProductContent", :include => ["type", "flavor"]
  belongs_to :shop, :include => ["state"]
  has_many :reviews, :include => ["content"], :order  => "id DESC"
  has_many :review_images, :order => "id DESC"
  has_many :providers, :order => "price_cents DESC"
  has_many :images, class_name: "ProductImage", order: "id DESC"

  # validation
  validates :name, :shop_id, :presence => true
  validates :name, :length => {:maximum => 200}

  # kaminari config
  default_scope :order => "products.updated_at DESC"
  paginates_per 10

  # named_scope

  scope :find_published, where(published_flg: 1)
  scope :find_unpublished, where(published_flg: 0)

  def published?
    self.published_flg == 1
  end

  def image
    self.images.first
  end
end
