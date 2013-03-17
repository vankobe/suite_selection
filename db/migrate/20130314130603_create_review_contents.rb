class CreateReviewContents < ActiveRecord::Migration
  def change
    create_table :review_contents do |t|
      t.integer :review_id
      t.text :comment

      t.timestamps
    end
  end
end
