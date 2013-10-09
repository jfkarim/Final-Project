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

ActiveRecord::Schema.define(:version => 20131009141648) do

  create_table "friend_requests", :force => true do |t|
    t.integer  "requester_id"
    t.integer  "requested_id"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "friend_requests", ["requested_id"], :name => "index_friend_requests_on_requested_id"
  add_index "friend_requests", ["requester_id"], :name => "index_friend_requests_on_requester_id"

  create_table "friendships", :force => true do |t|
    t.integer  "in_friend_id"
    t.integer  "out_friend_id"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "friendships", ["in_friend_id", "out_friend_id"], :name => "index_friendships_on_in_friend_id_and_out_friend_id"
  add_index "friendships", ["in_friend_id"], :name => "index_friendships_on_in_friend_id"
  add_index "friendships", ["out_friend_id"], :name => "index_friendships_on_out_friend_id"

  create_table "group_users", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
  end

  add_index "group_users", ["group_id"], :name => "index_group_users_on_group_id"
  add_index "group_users", ["user_id", "group_id"], :name => "index_group_users_on_user_id_and_group_id"
  add_index "group_users", ["user_id"], :name => "index_group_users_on_user_id"

  create_table "groups", :force => true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "groups", ["admin_id"], :name => "index_groups_on_admin_id"

  create_table "influences", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "influences", ["name"], :name => "index_influences_on_name"

  create_table "locations", :force => true do |t|
    t.string   "city",       :null => false
    t.string   "country",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "locations", ["city"], :name => "index_locations_on_city"
  add_index "locations", ["country"], :name => "index_locations_on_country"

  create_table "media", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "media", ["name"], :name => "index_media_on_name"

  create_table "themes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "themes", ["name"], :name => "index_themes_on_name"

  create_table "user_influences", :force => true do |t|
    t.integer  "influence_id", :null => false
    t.integer  "user_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "user_influences", ["influence_id"], :name => "index_user_influences_on_influence_id"
  add_index "user_influences", ["user_id", "influence_id"], :name => "index_user_influences_on_user_id_and_influence_id"
  add_index "user_influences", ["user_id"], :name => "index_user_influences_on_user_id"

  create_table "user_locations", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "location_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_locations", ["location_id"], :name => "index_user_locations_on_location_id"
  add_index "user_locations", ["user_id", "location_id"], :name => "index_user_locations_on_user_id_and_location_id"
  add_index "user_locations", ["user_id"], :name => "index_user_locations_on_user_id"

  create_table "user_media", :force => true do |t|
    t.integer  "medium_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_media", ["medium_id"], :name => "index_user_media_on_medium_id"
  add_index "user_media", ["user_id", "medium_id"], :name => "index_user_media_on_user_id_and_medium_id"
  add_index "user_media", ["user_id"], :name => "index_user_media_on_user_id"

  create_table "user_themes", :force => true do |t|
    t.integer  "theme_id",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_themes", ["theme_id"], :name => "index_user_themes_on_theme_id"
  add_index "user_themes", ["user_id", "theme_id"], :name => "index_user_themes_on_user_id_and_theme_id"
  add_index "user_themes", ["user_id"], :name => "index_user_themes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "artist_name"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

end
