# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_29_124235) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buffets", force: :cascade do |t|
    t.string "commercial_name"
    t.string "legal_name"
    t.string "cnpj"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_methods_id"
    t.index ["address_id"], name: "index_buffets_on_address_id"
    t.index ["payment_methods_id"], name: "index_buffets_on_payment_methods_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "min_people"
    t.integer "max_people"
    t.integer "default_event_duration_minutes"
    t.boolean "alcoholic_drinks"
    t.boolean "decoration"
    t.boolean "parking_service"
    t.boolean "valet"
    t.boolean "exclusive_buffet_location"
    t.integer "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "buffet_id"
    t.index ["buffet_id"], name: "index_events_on_buffet_id"
    t.index ["price_id"], name: "index_events_on_price_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.boolean "credit_card"
    t.boolean "debit_card"
    t.boolean "pix"
    t.boolean "ticket_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer "base_price_weekdays"
    t.integer "additional_person_price_weekdays"
    t.integer "extra_event_hour_price_weekdays"
    t.integer "base_price_weekend"
    t.integer "additional_person_price_weekend"
    t.integer "extra_event_hour_price_weekend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "cpf"
    t.boolean "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "buffet_id"
    t.index ["buffet_id"], name: "index_users_on_buffet_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buffets", "addresses"
  add_foreign_key "buffets", "payment_methods", column: "payment_methods_id"
  add_foreign_key "events", "buffets"
  add_foreign_key "events", "prices"
  add_foreign_key "users", "buffets"
end
