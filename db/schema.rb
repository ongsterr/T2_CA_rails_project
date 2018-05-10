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

ActiveRecord::Schema.define(version: 20180510115520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "transporter_id"
    t.bigint "traveler_id"
    t.string "booking_ref_number"
    t.date "booking_date_from"
    t.date "booking_date_to"
    t.integer "number_of_traveler"
    t.decimal "transporter_cost"
    t.decimal "platform_cost"
    t.decimal "total_cost"
    t.boolean "booking_confirmed?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "itinerary_file_data"
    t.index ["product_id"], name: "index_bookings_on_product_id"
    t.index ["transporter_id"], name: "index_bookings_on_transporter_id"
    t.index ["traveler_id"], name: "index_bookings_on_traveler_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "location"
    t.string "country"
    t.string "continent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "transporter_id"
    t.decimal "price_per_day"
    t.string "vehicle_model"
    t.string "vehicle_capacity"
    t.text "vehicle_description"
    t.text "vehicle_image_data"
    t.string "cancellation_policy"
    t.text "things_to_note"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_products_on_location_id"
    t.index ["transporter_id"], name: "index_products_on_transporter_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "mobile_phone"
    t.text "about_me"
    t.string "language_1"
    t.string "language_2"
    t.string "language_3"
    t.text "profile_image_data"
    t.string "addr_unit_number"
    t.string "addr_street_number"
    t.string "addr_street_name"
    t.string "addr_city"
    t.string "addr_state"
    t.string "addr_postcode"
    t.string "addr_country_code"
    t.string "passport_number"
    t.date "passport_expiry_date"
    t.string "passport_country_code"
    t.text "passport_image_data"
    t.string "drivers_license_number"
    t.date "drivers_license_expiry_date"
    t.string "drivers_license_country_code"
    t.text "drivers_license_image_data"
    t.boolean "verified?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "reviewer_id"
    t.bigint "reviewed_id"
    t.text "review"
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["reviewed_id"], name: "index_reviews_on_reviewed_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "products"
  add_foreign_key "bookings", "users", column: "transporter_id"
  add_foreign_key "bookings", "users", column: "traveler_id"
  add_foreign_key "products", "locations"
  add_foreign_key "products", "users", column: "transporter_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users", column: "reviewed_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
