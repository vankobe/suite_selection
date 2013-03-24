class AddScoreToProduct < ActiveRecord::Migration
  def change
    add_column :products, :score, :float, :after => "shop_id"
  end
end
