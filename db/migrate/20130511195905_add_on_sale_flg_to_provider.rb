class AddOnSaleFlgToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :on_sale_flg, :boolean, after: "url"
  end
end
