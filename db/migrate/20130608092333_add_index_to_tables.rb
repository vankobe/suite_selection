class AddIndexToTables < ActiveRecord::Migration
  def change
    # admin_users
    add_index :admin_users, :login_name, :unique => true
    # countries
    add_index :countries, :name_ja, :unique => true
    add_index :countries, :name_en, :unique => true
    # flavors
    add_index :flavors, :name, :unique => true
    # product_categories
    add_index :product_categories, :name, :unique => true
    # product_contents
    add_index :product_contents, :name
    add_index :product_contents, :product_id
    # product_images
    add_index :product_images, :product_id
    add_index :product_images, :product_image_uid, :unique => true
    # product_types
    add_index :product_types, :name, :unique => true
    # products
    add_index :products, :name
    # providers
    add_index :providers, :name
    add_index :providers, :url, :unique => true
    # review_contents
    add_index :review_contents, :review_id, :unique => true
    # review_images
    add_index :review_images, :review_id
    add_index :review_images, :product_id
    add_index :review_images, :user_id
    add_index :review_images, :review_image_uid, :unique => true
    # reviews
    add_index :reviews, :product_id
    add_index :reviews, :user_id
    # shop_images
    add_index :shop_images, :shop_id
    add_index :shop_images, :shop_image_uid, :unique => true
    # shop_reviews
    add_index :shop_reviews, :shop_id
    add_index :shop_reviews, :user_id
    # shops
    add_index :shops, :country_id
    add_index :shops, :state_id
    add_index :shops, :name, :unique => true
    # state
    add_index :states, :name, :unique => true
    add_index :states, :code, :unique => true
    # user
    add_index :users, :nickname, :unique => true
    add_index :users, :facebook_uid, :unique => true
    add_index :users, :email, :unique => true
  end
end
