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

ActiveRecord::Schema.define(version: 20131229104039) do

  create_table "notifiable_apps", force: true do |t|
    t.string   "name"
    t.text     "configuration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifiable_device_tokens", force: true do |t|
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifiable_device_tokens", ["token"], name: "index_notifiable_device_tokens_on_token", unique: true
  add_index "notifiable_device_tokens", ["user_id"], name: "index_notifiable_device_tokens_on_user_id"

  create_table "notifiable_notifications", force: true do |t|
    t.text     "message"
    t.text     "params"
    t.integer  "app_id"
    t.integer  "sent_count",             default: 0
    t.integer  "gateway_accepted_count", default: 0
    t.integer  "opened_count",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifiable_statuses", force: true do |t|
    t.integer  "notification_id"
    t.integer  "device_token_id"
    t.integer  "status"
    t.datetime "created_at"
  end

  create_table "users", force: true do |t|
    t.string "email", default: "", null: false
  end

end
