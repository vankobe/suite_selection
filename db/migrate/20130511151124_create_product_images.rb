class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :id
      t.integer :product_id
      t.string :product_image_uid
      t.string :product_image_name
      t.text :comment

      t.timestamps
    end
  end
end
