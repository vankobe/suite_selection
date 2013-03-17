class ShopReviewImage < ActiveRecord::Base
  attr_accessible :comment, :image_path, :review_id, :shop_id
  belongs_to :shop_review

  FILE_DIR= File.join(Rails.root, "app", "assets", "images", "shop")

  class << self
    def save_from_image_file(image, review)
      File.open(file_path, "wb") do |f|
        f.puts(image.read)
      end
      review_image = self.new({:review_id => review.id, :shop_id => review.shop_id, :image_path => file_path})
      review_image.save!
    end

    private
    def file_path
      str = FILE_DIR + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
    end
  end
end
