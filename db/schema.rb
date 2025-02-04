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

ActiveRecord::Schema[8.0].define(version: 2025_02_04_195802) do
  create_table "chat_messages", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "user_id", null: false
    t.string "body", default: "", null: false
    t.string "sender_name"
    t.string "sender_type"
    t.boolean "read", default: false, null: false
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_chat_messages_on_driver_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

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

  create_table "events", force: :cascade do |t|
    t.string "source"
    t.json "payload"
    t.string "status"
    t.text "processing_errors"
    t.string "event_type"
    t.string "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_submissions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "form_template_id"
    t.string "samsara_id"
    t.integer "submitted_by_id"
    t.integer "status", default: 0
    t.integer "assigned_to_id"
    t.integer "stop_id"
    t.json "submission_json", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_form_submissions_on_assigned_to_id"
    t.index ["form_template_id"], name: "index_form_submissions_on_form_template_id"
    t.index ["stop_id"], name: "index_form_submissions_on_stop_id"
    t.index ["submitted_by_id"], name: "index_form_submissions_on_submitted_by_id"
    t.index ["user_id"], name: "index_form_submissions_on_user_id"
  end

  create_table "form_templates", force: :cascade do |t|
    t.string "samsara_id"
    t.string "samsara_revision_id"
    t.json "template_json", default: {}
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "slug"
    t.index ["user_id"], name: "index_form_templates_on_user_id"
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

  create_table "kafka_messages", force: :cascade do |t|
    t.string "topic", null: false
    t.string "key"
    t.json "payload", default: {}
    t.text "processing_errors", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "order_stops", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "stop_id", null: false
    t.integer "stop_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_stops_on_order_id"
    t.index ["stop_id"], name: "index_order_stops_on_stop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "from_location_id", null: false
    t.integer "to_location_id", null: false
    t.integer "status", default: 0
    t.datetime "requested_pickup_at"
    t.datetime "requested_delivery_at"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["from_location_id"], name: "index_orders_on_from_location_id"
    t.index ["to_location_id"], name: "index_orders_on_to_location_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "scheduled_start_time"
    t.datetime "scheduled_end_time"
    t.datetime "actual_start_time"
    t.datetime "actual_end_time"
    t.json "settings"
    t.integer "driver_id"
    t.integer "vehicle_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "samsara_id"
    t.index ["driver_id"], name: "index_routes_on_driver_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
    t.index ["vehicle_id"], name: "index_routes_on_vehicle_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "samsara_id"
    t.datetime "scheduled_arrival_time"
    t.datetime "scheduled_departure_time"
    t.datetime "actual_arrival_time"
    t.datetime "actual_departure_time"
    t.datetime "en_route_time"
    t.integer "state", default: 0
    t.string "live_sharing_url"
    t.text "notes"
    t.integer "route_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_stops_on_location_id"
    t.index ["route_id"], name: "index_stops_on_route_id"
  end

  create_table "trailers", force: :cascade do |t|
    t.string "name"
    t.string "make"
    t.string "model"
    t.text "notes"
    t.string "vin"
    t.integer "year"
    t.string "license_plate"
    t.string "samsara_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trailers_on_user_id"
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

  create_table "webhook_events", force: :cascade do |t|
    t.string "source", null: false
    t.json "payload", default: {}, null: false
    t.integer "status", default: 0, null: false
    t.text "processing_errors"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chat_messages", "drivers"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "drivers", "users"
  add_foreign_key "form_submissions", "drivers", column: "assigned_to_id"
  add_foreign_key "form_submissions", "drivers", column: "submitted_by_id"
  add_foreign_key "form_submissions", "form_templates"
  add_foreign_key "form_submissions", "stops"
  add_foreign_key "form_submissions", "users"
  add_foreign_key "form_templates", "users"
  add_foreign_key "hours_of_service_clocks", "drivers"
  add_foreign_key "locations", "users"
  add_foreign_key "order_stops", "orders"
  add_foreign_key "order_stops", "stops"
  add_foreign_key "orders", "locations", column: "from_location_id"
  add_foreign_key "orders", "locations", column: "to_location_id"
  add_foreign_key "orders", "users"
  add_foreign_key "routes", "drivers"
  add_foreign_key "routes", "users"
  add_foreign_key "routes", "vehicles"
  add_foreign_key "sessions", "users"
  add_foreign_key "stops", "locations"
  add_foreign_key "stops", "routes"
  add_foreign_key "trailers", "users"
  add_foreign_key "vehicles", "users"
end
