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

ActiveRecord::Schema.define(:version => 20130218050553) do

  create_table "contents", :force => true do |t|
    t.string   "title"
    t.integer  "creator_id"
    t.integer  "parent_group_id"
    t.boolean  "is_private"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "event_posts", :force => true do |t|
    t.integer  "content_id"
    t.string   "location"
    t.string   "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.boolean  "is_all_day"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "image_posts", :force => true do |t|
    t.integer  "content_id"
    t.string   "image_url"
    t.integer  "x_pixels"
    t.integer  "y_pixels"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "text_posts", :force => true do |t|
    t.integer  "content_id"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "url_posts", :force => true do |t|
    t.integer  "content_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "video_posts", :force => true do |t|
    t.integer  "content_id"
    t.string   "video_url"
    t.integer  "length"
    t.integer  "x_pixels"
    t.integer  "y_pixels"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
