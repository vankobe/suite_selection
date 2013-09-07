class AddFlavorNameToProductContent < ActiveRecord::Migration
  def change
    add_column :product_contents, :flavor_name, :string
  end
end
