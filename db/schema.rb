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

ActiveRecord::Schema.define(version: 20180111182641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "age"
    t.datetime "currentDate"
    t.string "firstName"
    t.string "lastName"
    t.datetime "dob"
    t.string "phoneNumber"
    t.boolean "leaveMessage"
    t.string "email"
    t.string "occupation"
    t.string "employer"
    t.string "employerAddress"
    t.string "workPhone"
    t.boolean "leaveMessageWork"
    t.string "spouse_first_name"
    t.string "spouse_last_name"
    t.datetime "spouse_dob"
    t.string "spouse_occupation"
    t.string "spouse_employer"
    t.string "spouse_phone"
    t.string "emergency_name"
    t.string "emergency_relation"
    t.string "emergency_address"
    t.string "emergency_phone"
    t.boolean "health_insurance"
    t.string "insurance_company"
    t.string "physician"
    t.string "physician_phone"
    t.string "medication"
    t.boolean "counselor_seen_before"
    t.string "counselor_seen"
    t.string "help_reason"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
