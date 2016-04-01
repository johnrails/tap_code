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

ActiveRecord::Schema.define(version: 20160331223230) do

  create_table "campaign_qualifications", force: :cascade do |t|
    t.integer  "question_id",       limit: 4
    t.text     "pre_codes",         limit: 65535
    t.integer  "campaign_quota_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "campaign_quota", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "num_respondents", limit: 4
    t.integer  "question_id",     limit: 4
    t.string   "pre_codes",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "campaign_id",     limit: 4
  end

  add_index "campaign_quota", ["campaign_id"], name: "index_campaign_quota_on_campaign_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "cpi",                 limit: 255
    t.integer  "days_in_field",       limit: 4
    t.integer  "incidence",           limit: 4
    t.integer  "status",              limit: 4
    t.integer  "length_of_interview", limit: 4
    t.integer  "total_remaining",     limit: 4
    t.string   "supplier_link",       limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
