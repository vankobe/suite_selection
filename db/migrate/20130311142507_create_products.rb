class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :shop_id
      t.integer :country_id
      t.integer :currency_id
      t.integer :price
      t.string :image_path

      t.timestamps
    end
  end
end
