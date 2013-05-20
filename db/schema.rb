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

ActiveRecord::Schema.define(:version => 20130520115014) do

  create_table "admin_users", :force => true do |t|
    t.string   "login_name", :null => false
    t.string   "password",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string "name_ja"
    t.string "name_en"
  end

  create_table "flavors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.string "name", :null => false
  end

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

  create_table "product_images", :force => true do |t|
    t.integer  "product_id"
    t.string   "product_image_uid"
    t.string   "product_image_name"
    t.text     "comment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "product_types", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "shop_id"
    t.float    "score"
    t.string   "name"
    t.string   "expire_date"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "published_flg", :default => false, :null => false
  end

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

  create_table "review_contents", :force => true do |t|
    t.integer  "review_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.float    "score"
    t.integer  "language_id"
    t.string   "subject"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "shop_images", :force => true do |t|
    t.integer  "shop_id"
    t.string   "shop_image_uid"
    t.string   "shop_image_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

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

  create_table "states", :force => true do |t|
    t.integer "country_id"
    t.string  "name"
    t.string  "code"
  end

  create_table "users", :force => true do |t|
    t.integer  "facebook_uid", :limit => 8
    t.string   "nickname"
    t.string   "email"
    t.string   "image_url"
    t.string   "facebook_url"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
