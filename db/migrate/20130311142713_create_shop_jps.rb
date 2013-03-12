class CreateShopJps < ActiveRecord::Migration
  def change
    create_table :shop_jps do |t|
      t.integer :shop_id
      t.integer :country_id
      t.integer :prefecture_id
      t.integer :city_id
      t.string :name, :default => ""
      t.string :short_desc, :default => ""
      t.text :long_desc, :default => ""
      t.decimal :longitude
      t.decimal :latitude
      t.string :image_path

      t.timestamps
    end
  end
end
