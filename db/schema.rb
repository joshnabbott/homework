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

ActiveRecord::Schema.define(version: 20161006201313) do

  create_table "threats", force: :cascade do |t|
    t.date     "date"
    t.integer  "all_total"
    t.integer  "all_uniques"
    t.integer  "ips_total"
    t.integer  "ips_uniques"
    t.integer  "files_total"
    t.integer  "files_uniques"
    t.integer  "domains_total"
    t.integer  "domains_uniques"
    t.integer  "urls_total"
    t.integer  "urls_uniques"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
