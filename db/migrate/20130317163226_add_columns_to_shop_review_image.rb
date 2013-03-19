class AddColumnsToShopReviewImage < ActiveRecord::Migration
  def change
    add_column :shop_review_images, :shop_review_image_uid, :string, :after => "review_id"
    add_column :shop_review_images, :shop_review_image_name, :string, :after => "review_id"
    remove_column :shop_review_images, :image_path
  end
end
