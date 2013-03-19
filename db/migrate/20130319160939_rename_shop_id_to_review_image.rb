class RenameShopIdToReviewImage < ActiveRecord::Migration
  def up
    rename_column :review_images, :shop_id, :product_id
  end

  def down
    rename_column :review_images, :product_id, :shop_id
  end
end
