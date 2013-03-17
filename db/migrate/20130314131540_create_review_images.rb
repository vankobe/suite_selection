class CreateReviewImages < ActiveRecord::Migration
  def change
    create_table :review_images do |t|
      t.integer :id
      t.integer :shop_id
      t.integer :user_id
      t.integer :review_id
      t.string :image_path
      t.text :commment

      t.timestamps
    end
  end
end
