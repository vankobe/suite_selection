# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130608092333) do

  create_table "admin_users", :force => true do |t|
    t.string   "login_name", :null => false
    t.string   "password",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admin_users", ["login_name"], :name => "index_admin_users_on_login_name", :unique => true

  create_table "countries", :force => true do |t|
    t.string "name_ja"
    t.string "name_en"
  end

  add_index "countries", ["name_en"], :name => "index_countries_on_name_en", :unique => true
  add_index "countries", ["name_ja"], :name => "index_countries_on_name_ja", :unique => true

  create_table "flavors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flavors", ["name"], :name => "index_flavors_on_name", :unique => true

  create_table "product_categories", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "product_categories", ["name"], :name => "index_product_categories_on_name", :unique => true

  create_table "product_contents", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "flavor_id"
    t.string   "name"
    t.integer  "quantity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "product_contents", ["name"], :name => "index_product_contents_on_name"
  add_index "product_contents", ["product_id"], :name => "index_product_contents_on_product_id"

  create_table "product_images", :force => true do |t|
    t.integer  "product_id"
    t.string   "product_image_uid"
    t.string   "product_image_name"
    t.text     "comment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "product_images", ["product_id"], :name => "index_product_images_on_product_id"
  add_index "product_images", ["product_image_uid"], :name => "index_product_images_on_product_image_uid", :unique => true

  create_table "product_types", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "product_types", ["name"], :name => "index_product_types_on_name", :unique => true

  create_table "products", :force => true do |t|
    t.integer  "shop_id"
    t.float    "score"
    t.string   "name"
    t.string   "expire_date"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "published_flg", :default => false, :null => false
  end

  add_index "products", ["name"], :name => "index_products_on_name"

  create_table "providers", :force => true do |t|
    t.integer  "product_id"
    t.integer  "country_id"
    t.string   "name"
    t.string   "url"
    t.boolean  "on_sale_flg"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "price_cents",    :default => 0,     :null => false
    t.string   "price_currency", :default => "JPY", :null => false
  end

  add_index "providers", ["name"], :name => "index_providers_on_name"
  add_index "providers", ["url"], :name => "index_providers_on_url", :unique => true

  create_table "review_contents", :force => true do |t|
    t.integer  "review_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "review_contents", ["review_id"], :name => "index_review_contents_on_review_id", :unique => true

  create_table "review_images", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "review_id"
    t.string   "review_image_name"
    t.string   "review_image_uid"
    t.text     "comment"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "review_images", ["product_id"], :name => "index_review_images_on_product_id"
  add_index "review_images", ["review_id"], :name => "index_review_images_on_review_id"
  add_index "review_images", ["review_image_uid"], :name => "index_review_images_on_review_image_uid", :unique => true
  add_index "review_images", ["user_id"], :name => "index_review_images_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.float    "score"
    t.integer  "language_id"
    t.string   "subject"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reviews", ["product_id"], :name => "index_reviews_on_product_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "shop_images", :force => true do |t|
    t.integer  "shop_id"
    t.string   "shop_image_uid"
    t.string   "shop_image_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "shop_images", ["shop_id"], :name => "index_shop_images_on_shop_id"
  add_index "shop_images", ["shop_image_uid"], :name => "index_shop_images_on_shop_image_uid", :unique => true

  create_table "shop_review_images", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.integer  "review_id"
    t.string   "shop_review_image_name"
    t.string   "shop_review_image_uid"
    t.text     "comment"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "shop_reviews", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.integer  "language_id"
    t.float    "score"
    t.string   "subject"
    t.text     "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "shop_reviews", ["shop_id"], :name => "index_shop_reviews_on_shop_id"
  add_index "shop_reviews", ["user_id"], :name => "index_shop_reviews_on_user_id"

  create_table "shops", :force => true do |t|
    t.float    "score"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "name"
    t.string   "home_url"
    t.string   "online_url"
    t.decimal  "longitude",  :precision => 10, :scale => 0
    t.decimal  "latitude",   :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "shops", ["country_id"], :name => "index_shops_on_country_id"
  add_index "shops", ["name"], :name => "index_shops_on_name", :unique => true
  add_index "shops", ["state_id"], :name => "index_shops_on_state_id"

  create_table "states", :force => true do |t|
    t.integer "country_id"
    t.string  "name"
    t.string  "code"
  end

  add_index "states", ["code"], :name => "index_states_on_code", :unique => true
  add_index "states", ["name"], :name => "index_states_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "facebook_uid", :limit => 8
    t.string   "nickname"
    t.string   "email"
    t.string   "image_url"
    t.string   "facebook_url"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["facebook_uid"], :name => "index_users_on_facebook_uid", :unique => true
  add_index "users", ["nickname"], :name => "index_users_on_nickname", :unique => true

end
