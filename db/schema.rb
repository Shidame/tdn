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

ActiveRecord::Schema.define(:version => 20120712133629) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "building_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "width"
    t.integer  "height"
    t.string   "land_type_required"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "buildings", :force => true do |t|
    t.integer  "building_type_id"
    t.integer  "city_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "laborer",    :default => 0
    t.integer  "deben",      :default => 0
    t.integer  "happiness",  :default => 0
  end

  add_index "cities", ["user_id"], :name => "index_cities_on_user_id"

  create_table "discoveries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "technology_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "technologies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "depth"
  end

  create_table "tiles", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.string   "land_type"
    t.integer  "city_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "building_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
