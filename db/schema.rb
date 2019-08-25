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

ActiveRecord::Schema.define(version: 2019_08_25_085859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.string "founder"
    t.integer "country"
    t.text "concept"
    t.date "found_year"
    t.string "official"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_brands_on_country"
    t.index ["name"], name: "index_brands_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "note_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_comments_on_note_id"
  end

  create_table "fragrances", force: :cascade do |t|
    t.string "name", null: false
    t.integer "type"
    t.text "description"
    t.integer "country_of_origin"
    t.date "release"
    t.integer "price", default: 0
    t.text "image"
    t.string "URL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "perfumer_id"
    t.index ["brand_id"], name: "index_fragrances_on_brand_id"
    t.index ["country_of_origin"], name: "index_fragrances_on_country_of_origin"
    t.index ["name"], name: "index_fragrances_on_name"
    t.index ["perfumer_id"], name: "index_fragrances_on_perfumer_id"
    t.index ["type"], name: "index_fragrances_on_type"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_labels_on_name", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.date "date"
    t.integer "weather"
    t.integer "humidity"
    t.integer "point"
    t.integer "scene"
    t.string "layerd"
    t.boolean "want"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fragrance_id", null: false
    t.bigint "user_id", null: false
    t.integer "label_ids", array: true
    t.index ["fragrance_id"], name: "index_notes_on_fragrance_id"
    t.index ["humidity"], name: "index_notes_on_humidity"
    t.index ["label_ids", "fragrance_id"], name: "index_notes_on_label_ids_and_fragrance_id"
    t.index ["label_ids"], name: "index_notes_on_label_ids"
    t.index ["point"], name: "index_notes_on_point"
    t.index ["scene"], name: "index_notes_on_scene"
    t.index ["user_id"], name: "index_notes_on_user_id"
    t.index ["weather"], name: "index_notes_on_weather"
  end

  create_table "perfumers", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "destination_brand_id"
    t.bigint "masterpiece_id"
    t.integer "country"
    t.text "thought"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_brand_id"], name: "index_perfumers_on_destination_brand_id"
    t.index ["masterpiece_id"], name: "index_perfumers_on_masterpiece_id"
    t.index ["name"], name: "index_perfumers_on_name"
  end

  create_table "purchases", force: :cascade do |t|
    t.date "date"
    t.date "opening_date"
    t.date "expiration_date"
    t.string "where_to_buy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fragrance_id", null: false
    t.bigint "user_id", null: false
    t.index ["fragrance_id"], name: "index_purchases_on_fragrance_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.text "icon"
    t.integer "favorite_brand_id"
    t.integer "favorite_perfumer_id"
    t.integer "favorite_type"
    t.integer "prefecture"
    t.integer "sex"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "signature_fragrance_id"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["signature_fragrance_id"], name: "index_users_on_signature_fragrance_id"
  end

  add_foreign_key "comments", "notes"
  add_foreign_key "fragrances", "brands"
  add_foreign_key "fragrances", "perfumers"
  add_foreign_key "notes", "fragrances"
  add_foreign_key "notes", "users"
  add_foreign_key "perfumers", "fragrances", column: "destination_brand_id"
  add_foreign_key "perfumers", "fragrances", column: "masterpiece_id"
  add_foreign_key "purchases", "fragrances"
  add_foreign_key "purchases", "users"
  add_foreign_key "users", "fragrances", column: "signature_fragrance_id"
end
