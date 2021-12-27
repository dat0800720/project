# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_23_183944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "break_times", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.time "start_time"
    t.time "end_time"
    t.date "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_id"], name: "index_break_times_on_request_id"
  end

  create_table "calendar_members", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "calendar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["calendar_id"], name: "index_calendar_members_on_calendar_id"
    t.index ["member_id"], name: "index_calendar_members_on_member_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "member_id", null: false
    t.string "title"
    t.string "content"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_calendars_on_member_id"
    t.index ["room_id"], name: "index_calendars_on_room_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "member_requests", force: :cascade do |t|
    t.bigint "request_id"
    t.bigint "member_id"
    t.integer "type_recipient"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_member_requests_on_member_id"
    t.index ["request_id"], name: "index_member_requests_on_request_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "employee_code"
    t.string "name"
    t.integer "sex"
    t.date "bithday"
    t.string "nation"
    t.string "marriage"
    t.string "nationality"
    t.string "religion"
    t.string "identity_card"
    t.date "date_issued"
    t.string "issued_at"
    t.string "home_town"
    t.string "permanent_address"
    t.string "presenter"
    t.integer "license_plates"
    t.string "vehicle_brand"
    t.string "vehicle_color"
    t.string "phone_number"
    t.string "relatives_phone"
    t.string "current_address"
    t.integer "bank_account"
    t.string "bank_name"
    t.integer "work_status"
    t.string "seniority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "holiday_id", null: false
    t.string "content"
    t.integer "request_status"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["holiday_id"], name: "index_requests_on_holiday_id"
    t.index ["member_id"], name: "index_requests_on_member_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "max_member"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "user_type", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "notes"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "break_times", "requests"
  add_foreign_key "calendar_members", "calendars"
  add_foreign_key "calendar_members", "members"
  add_foreign_key "calendars", "members"
  add_foreign_key "calendars", "rooms"
  add_foreign_key "member_requests", "members"
  add_foreign_key "member_requests", "requests"
  add_foreign_key "members", "users"
  add_foreign_key "requests", "holidays"
  add_foreign_key "requests", "members"
end
