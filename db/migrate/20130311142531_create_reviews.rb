class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :score
      t.integer :country_id

      t.timestamps
    end
  end
end
