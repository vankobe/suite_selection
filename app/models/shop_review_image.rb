# encoding: utf-8
class ShopReviewImage < ActiveRecord::Base
  attr_accessible :comment, :review_id, :shop_id,  :shop_review_image
  belongs_to :shop_review
  image_accessor :shop_review_image

  FILE_DIR_ROOT = File.join(Rails.root, "app", "assets", "images", "/")
  FILE_DIR = File.join("shop", "/")

#  class << self
#    def save_from_image_file(image, review)
#      image = Magick::ImageList.new(image.read)
#      raise "フォーマットはjpgにしてください" unless image.format !~ /jpe*g/i
#
#      IMAGE_SIZES.each do |image_size|
#        image.resize(image_size, image_size).write(file_path(image_size))
#      end
#
#      review_image = self.new({:review_id => review.id, :shop_id => review.shop_id, :image_path => db_file_path})
#      review_image.save!
#    end
#
#    private
#    def stored_file_path(image_size="")
#      str = FILE_DIR_ROOT + FILE_DIR + image_size + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
#    end
#
#    def db_file_path(image_size)
#      str = FILE_DIR + image_size + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
#    end
#  end
end
