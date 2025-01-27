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

ActiveRecord::Schema[8.0].define(version: 2025_01_27_231437) do
  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.string "samsara_id"
    t.string "phone_number"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "hours_of_service_clocks", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "time_until_break_ms"
    t.integer "drive_time_left_ms"
    t.integer "shift_time_left_ms"
    t.integer "cycle_time_left_ms"
    t.integer "duty_status", default: 0
    t.integer "shift_violation_ms"
    t.integer "cycle_violation_ms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_hours_of_service_clocks_on_driver_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "samsara_id"
    t.string "formatted_address"
    t.json "geofence", default: {}
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["samsara_id"], name: "index_locations_on_samsara_id", unique: true
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.json "samsara_credentials", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "name"
    t.string "year"
    t.string "samsara_id"
    t.text "notes"
    t.string "vin"
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["samsara_id"], name: "index_vehicles_on_samsara_id", unique: true
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "drivers", "users"
  add_foreign_key "hours_of_service_clocks", "drivers"
  add_foreign_key "locations", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "vehicles", "users"
end
