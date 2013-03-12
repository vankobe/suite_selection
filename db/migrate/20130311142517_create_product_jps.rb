class CreateProductJps < ActiveRecord::Migration
  def change
    create_table :product_jps do |t|
      t.integer :product_id
      t.string :name, :default => ""
      t.string :short_desc, :default => ""
      t.text :long_desc, :default => ""

      t.timestamps
    end
  end
end
