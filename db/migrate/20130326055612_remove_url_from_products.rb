class RemoveUrlFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :country_id
    remove_column :products, :currency_id
    remove_column :products, :price
    remove_column :products, :url
  end

  def down
    add_column :products, :country_id, :integer, :after => :score
    add_column :products, :url, :string, :after => :name
    add_column :products, :currency_id, :integer, :after => :url
    add_column :products, :price, :integer, :after => :currency_id
  end
end
