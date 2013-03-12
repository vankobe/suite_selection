class CreateShopLinks < ActiveRecord::Migration
  def change
    create_table :shop_links do |t|
      t.integer :country_id
      t.string :url

      t.timestamps
    end
  end
end
