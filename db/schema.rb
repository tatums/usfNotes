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

ActiveRecord::Schema.define(:version => 20110301164900) do

  create_table "attachments", :force => true do |t|
    t.string   "title"
    t.string   "phile_file_name"
    t.string   "phile_content_type"
    t.integer  "phile_file_size"
    t.datetime "phile_updated_at"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "note_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.boolean  "active",            :default => true
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "ip_address"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
