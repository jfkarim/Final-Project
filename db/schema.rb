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

ActiveRecord::Schema.define(:version => 20131222224516) do

  create_table "albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "event_users", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
  end

  add_index "event_users", ["event_id", "user_id"], :name => "index_event_users_on_event_id_and_user_id"
  add_index "event_users", ["event_id"], :name => "index_event_users_on_event_id"
  add_index "event_users", ["user_id"], :name => "index_event_users_on_user_id"

  create_table "events", :force => true do |t|
    t.integer  "admin_id"
    t.text     "description"
    t.string   "name"
    t.text     "address"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["admin_id"], :name => "index_events_on_admin_id"

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

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "likes", ["likeable_type", "likeable_id"], :name => "index_likes_on_likeable_type_and_likeable_id"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

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

  create_table "notifications", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "album_id"
    t.integer  "user_id"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wall_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "font"
    t.string   "color"
  end

  add_index "posts", ["color"], :name => "index_posts_on_color"
  add_index "posts", ["font"], :name => "index_posts_on_font"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"
  add_index "posts", ["wall_id", "user_id"], :name => "index_posts_on_wall_id_and_user_id"
  add_index "posts", ["wall_id"], :name => "index_posts_on_wall_id"

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
    t.string   "email",                        :null => false
    t.string   "password_digest",              :null => false
    t.string   "artist_name"
    t.string   "session_token"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

  create_table "walls", :force => true do |t|
    t.integer  "wallable_id"
    t.string   "wallable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "walls", ["wallable_type", "wallable_id"], :name => "index_walls_on_wallable_type_and_wallable_id"

end
