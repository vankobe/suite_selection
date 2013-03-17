class CreateShopReviewImages < ActiveRecord::Migration
  def change
    create_table :shop_review_images do |t|
      t.integer :shop_id
      t.integer :review_id
      t.string :image_path
      t.text :comment

      t.timestamps
    end
  end
end
