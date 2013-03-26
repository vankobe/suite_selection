class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :product_id
      t.integer :country_id
      t.integer :currency_id
      t.integer :price
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
