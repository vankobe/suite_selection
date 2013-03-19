class AddColumnsToReviewImage < ActiveRecord::Migration
  def change
    add_column :review_images, :review_image_uid, :string, :after => "review_id"
    add_column :review_images, :review_image_name, :string, :after => "review_id"
    remove_column :review_images, :image_path
  end
end
