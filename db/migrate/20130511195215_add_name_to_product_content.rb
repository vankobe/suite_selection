class AddNameToProductContent < ActiveRecord::Migration
  def change
    add_column :product_contents, :name, :string, after: "flavor_id"
  end
end
