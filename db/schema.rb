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

ActiveRecord::Schema.define(version: 20180119214130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "g_id"
    t.string "name"
    t.string "message"
    t.integer "unread_messages"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "gateway_text"
    t.string "gateway_mime"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "status"
    t.string "image_url"
    t.integer "unread_messages"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "g_id"
    t.string "label_ids"
    t.string "name"
    t.string "message"
    t.string "message_type"
    t.string "read"
    t.bigint "campaign_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_messages_on_campaign_id"
    t.index ["customer_id"], name: "index_messages_on_customer_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number"
    t.string "subscriber"
    t.string "country"
    t.string "status"
    t.bigint "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_phone_numbers_on_carrier_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "g_id"
    t.string "name"
    t.string "family_name"
    t.string "given_name"
    t.string "email"
    t.string "phone"
    t.string "image_url"
    t.string "code"
    t.string "id_token"
    t.string "access_token"
    t.string "refresh_token"
    t.string "expires_in"
    t.string "token_type"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "messages", "campaigns"
  add_foreign_key "messages", "customers"
  add_foreign_key "phone_numbers", "carriers"
end
