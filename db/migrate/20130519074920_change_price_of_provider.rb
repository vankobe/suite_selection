class ChangePriceOfProvider < ActiveRecord::Migration
  def up
    remove_column :providers, :price
    remove_column :providers, :currency_id
    add_money :providers, :price, currency: { default: "JPY"}
  end

  def down
    add_column :providers, :price, :integer
    add_column :providers, :currency_id, :integer
    remove_money :providers, :price
  end
end
