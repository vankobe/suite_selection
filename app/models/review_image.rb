class ReviewImage < ActiveRecord::Base
  attr_accessible :commment, :id, :image_path, :review_id, :shop_id, :user_id
  belongs_to :review

  FILE_DIR= File.join(Rails.root, "app", "assets", "images", "review")

  class << self
    def save_from_image_file(image, review)
      File.open(file_path, "wb") do |f|
        f.puts(image.read)
      end
      review_image = self.new({:review_id => review.id, :product_id => review.product_id, :image_path => file_path})
      review_image.save!
    end

    private
    def file_path
      str = FILE_DIR + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
    end
  end
end
