class CreateShopImages < ActiveRecord::Migration
  def change
    create_table :shop_images do |t|
      t.integer :shop_id
      t.string :shop_image_uid
      t.string :shop_image_name

      t.timestamps
    end
  end
end
