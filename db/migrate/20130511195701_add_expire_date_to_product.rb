class AddExpireDateToProduct < ActiveRecord::Migration
  def change
    add_column :products, :expire_date, :string, after: "name"
  end
end
