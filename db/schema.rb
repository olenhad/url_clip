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

ActiveRecord::Schema.define(version: 20140313022830) do

  create_table "accesses", force: true do |t|
    t.datetime "access_time"
    t.string   "ip_addr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "short_url_id"
  end

  add_index "accesses", ["short_url_id"], name: "index_accesses_on_short_url_id"

  create_table "short_urls", force: true do |t|
    t.string   "original_url"
    t.string   "short_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
