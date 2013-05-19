class AddPublishedFlgToProduct < ActiveRecord::Migration
  def change
    add_column :products, :published_flg, :boolean, null: false, default: 0
  end
end
