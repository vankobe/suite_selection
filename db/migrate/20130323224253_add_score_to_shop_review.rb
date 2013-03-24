class AddScoreToShopReview < ActiveRecord::Migration
  def change
    add_column :shop_reviews, :score, :float, :after => "language_id"
  end
end
