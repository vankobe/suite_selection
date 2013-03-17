class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :shop_id
      t.integer :country_id
      t.string :name
      t.string :url
      t.integer :currency_id
      t.integer :price

      t.timestamps
    end
  end
end
