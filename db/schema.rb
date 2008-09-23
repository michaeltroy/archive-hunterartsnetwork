# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 16) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "permalink"
    t.string   "category"
    t.text     "copy"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artworks", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.string   "title"
    t.string   "medium"
    t.string   "dimensions"
    t.string   "sale"
    t.integer  "parent_id"
    t.integer  "member_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_blends", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_mailers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "category"
    t.string   "title"
    t.string   "subtitle"
    t.string   "permalink"
    t.string   "location"
    t.string   "link"
    t.string   "artist"
    t.datetime "opendate"
    t.datetime "closedate"
    t.datetime "starttime"
    t.text     "copy"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "number"
    t.string   "username"
    t.string   "email"
    t.string   "pass_hash"
    t.string   "pass_salt"
    t.string   "firstname"
    t.string   "surname"
    t.string   "role"
    t.string   "medium"
    t.string   "permalink"
    t.string   "address"
    t.string   "state"
    t.string   "pcode"
    t.string   "phone"
    t.text     "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",     :default => false
    t.string   "category",   :default => "artist"
  end

  create_table "sessions", :force => true do |t|
    t.integer  "member_id"
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "update_mailers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.string   "title"
    t.text     "copy"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewings", :force => true do |t|
    t.string   "viewable_type"
    t.integer  "viewable_id"
    t.integer  "views",         :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at"
  end

end
