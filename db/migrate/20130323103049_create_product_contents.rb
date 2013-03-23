class CreateProductContents < ActiveRecord::Migration
  def change
    create_table :product_contents do |t|
      t.integer :product_id
      t.integer :category_id
      t.integer :type_id
      t.integer :flavor_id
      t.integer :quantity

      t.timestamps
    end
  end
end
