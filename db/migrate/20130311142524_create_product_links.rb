class CreateProductLinks < ActiveRecord::Migration
  def change
    create_table :product_links do |t|
      t.integer :country_id
      t.string :url

      t.timestamps
    end
  end
end
