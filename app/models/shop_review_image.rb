class ShopReviewImage < ActiveRecord::Base
  attr_accessible :comment, :image_path, :review_id, :shop_id
  belongs_to :shop_review

  FILE_DIR_ROOT = File.join(Rails.root, "app", "assets", "images", "/")
  FILE_DIR = File.join("shop", "/")

  class << self
    def save_from_image_file(image, review)
      File.open(stored_file_path, "wb") do |f|
        f.puts(image.read)
      end
      review_image = self.new({:review_id => review.id, :shop_id => review.shop_id, :image_path => db_file_path})
      review_image.save!
    end

    private
    def stored_file_path
      str = FILE_DIR_ROOT + FILE_DIR + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
    end

    def db_file_path
      str = FILE_DIR + sprintf("%08d", self.maximum("id").to_i)+ '.jpg'
    end
  end
end
