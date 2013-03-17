class CreateShopReviews < ActiveRecord::Migration
  def change
    create_table :shop_reviews do |t|
      t.integer :shop_id
      t.integer :language_id
      t.string :subject
      t.text :comment

      t.timestamps
    end
  end
end
