class ChangeQuantityOnProductContent < ActiveRecord::Migration
  def up
    change_column :product_contents, :quantity, :string
  end

  def down
    change_column :product_contents, :quantity, :integer
  end
end
