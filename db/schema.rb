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

ActiveRecord::Schema.define(version: 20171128104313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.float    "height"
    t.float    "weight"
    t.string   "body_type"
    t.string   "location_last_seen"
    t.float    "location_last_seen_lat"
    t.float    "location_last_seen_lon"
    t.date     "date_last_seen"
    t.text     "description"
    t.string   "status"
    t.string   "reporter_rel"
    t.integer  "public_user_id"
    t.string   "image"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "case_id"
    t.integer  "sighting_id"
    t.float    "image_match"
    t.float    "description_match"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "public_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "town"
    t.string   "status"
    t.string   "notification_token"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rails_push_notifications_apns_apps", force: :cascade do |t|
    t.text     "apns_dev_cert"
    t.text     "apns_prod_cert"
    t.boolean  "sandbox_mode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "rails_push_notifications_gcm_apps", force: :cascade do |t|
    t.string   "gcm_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_push_notifications_mpns_apps", force: :cascade do |t|
    t.text     "cert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_push_notifications_notifications", force: :cascade do |t|
    t.text     "destinations"
    t.integer  "app_id"
    t.string   "app_type"
    t.text     "data"
    t.text     "results"
    t.integer  "success"
    t.integer  "failed"
    t.boolean  "sent",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["app_id", "app_type", "sent"], name: "app_and_sent_index_on_rails_push_notifications", using: :btree
  end

  create_table "sightings", force: :cascade do |t|
    t.integer  "public_user_id"
    t.string   "name"
    t.string   "age"
    t.string   "body_type"
    t.float    "height"
    t.float    "weight"
    t.text     "description"
    t.string   "location"
    t.float    "location_lat"
    t.float    "location_lon"
    t.string   "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
