class ReviewImage < ActiveRecord::Base
  attr_accessible :commment, :review_id, :product_id, :user_id, :review_image
  belongs_to :review
  belongs_to :product

  validates :review_id, :product_id, :user_id, :review_image, :presence => true
  validates :comment, :length => {:maximum => 300}

  image_accessor :review_image

#  FILE_DIR= File.join(Rails.root, "app", "assets", "images", "review")
#  IMAGE_SIZES = [50, 100, 150, 320, 640]

#  class << self
#    def save_from_image_file(image, review)
#      image = Magick::ImageList.new(image)
#      raise "フォーマットはjpgにしてください" unless image.format !~ /jpe*g/i
#      
#      IMAGE_SIZES.each do |image_size|
#        image.resize(image_size, image_size).write(file_path(image_size))
#      end
#
#      review_image = self.new({:review_id => review.id, :product_id => review.product_id, :image_path => file_path})
#      review_image.save!
#    end
#
#    private
#    def file_path(image_size ="")
#      str = FILE_DIR + image_size + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
#    end
#  end
end
