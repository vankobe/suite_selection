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

ActiveRecord::Schema.define(:version => 20130311143112) do

  create_table "country_jps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_jps", :force => true do |t|
    t.integer  "product_id"
    t.string   "name",       :default => ""
    t.string   "short_desc", :default => ""
    t.text     "long_desc"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "product_links", :force => true do |t|
    t.integer  "country_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "country_id"
    t.integer  "currency_id"
    t.integer  "price"
    t.string   "image_path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "review_contents", :force => true do |t|
    t.integer  "review_id",  :null => false
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.float    "score"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shop_home_links", :force => true do |t|
    t.integer  "country_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shop_jps", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "country_id"
    t.integer  "prefecture_id"
    t.integer  "city_id"
    t.string   "name",                                         :default => ""
    t.string   "short_desc",                                   :default => ""
    t.text     "long_desc"
    t.decimal  "longitude",     :precision => 10, :scale => 0
    t.decimal  "latitude",      :precision => 10, :scale => 0
    t.string   "image_path"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "shop_links", :force => true do |t|
    t.integer  "country_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.float    "score"
    t.integer  "original_country_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nickname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
