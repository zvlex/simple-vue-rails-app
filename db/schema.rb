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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151103095347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "body"
    t.string   "ip"
    t.boolean  "is_hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title_ru",                     null: false
    t.string   "title_en",                     null: false
    t.text     "body_ru",                      null: false
    t.text     "body_en",                      null: false
    t.string   "source",                       null: false
    t.boolean  "is_published", default: false, null: false
    t.integer  "version",      default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
