class AddUserIdToShopReviewImage < ActiveRecord::Migration
  def change
    add_column :shop_review_images, :user_id, :integer, :after => "shop_id"
  end
end
