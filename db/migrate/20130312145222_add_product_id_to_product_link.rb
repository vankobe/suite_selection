class AddProductIdToProductLink < ActiveRecord::Migration
  def change
    add_column :product_links, :product_id, :integer, :after => "id"
  end
end
