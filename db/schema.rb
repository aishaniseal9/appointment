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

ActiveRecord::Schema.define(version: 2020_07_27_202709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "bookingdate"
    t.time "bookingtime"
    t.bigint "user_id", null: false
    t.bigint "hospital_id", null: false
    t.bigint "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id"], name: "index_bookings_on_hospital_id"
    t.index ["test_id"], name: "index_bookings_on_test_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "Hname"
    t.string "Haddress"
    t.string "contact"
    t.string "email"
    t.string "website"
    t.integer "no_of_test"
    t.date "cur_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "register_users", force: :cascade do |t|
    t.string "username"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_register_users_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "testdescription"
    t.integer "testamount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "contactno"
    t.string "address"
    t.string "email"
    t.date "dob"
    t.string "bloodgrp", limit: 3
    t.string "registerstatus"
    t.string "loggedstatus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "hospitals"
  add_foreign_key "bookings", "tests"
  add_foreign_key "bookings", "users"
  add_foreign_key "register_users", "users"
end
