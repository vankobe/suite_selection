class AddFreePostageFlgToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :free_postage_flg, :boolean, after: :on_sale_flg, null: false, default: false
  end
end
