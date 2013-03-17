class AddUserIdToShopReview < ActiveRecord::Migration
  def change
    add_column :shop_reviews, :user_id, :integer, :after => "shop_id"
  end
end
