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

ActiveRecord::Schema.define(version: 2019_09_30_172507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "event_logs", force: :cascade do |t|
    t.date "event_date"
    t.bigint "franchise_id"
    t.string "fran"
    t.string "lastname"
    t.string "email"
    t.string "event_desc"
  end

  create_table "franchises", force: :cascade do |t|
    t.string "area"
    t.string "mast"
    t.integer "region"
    t.string "franchise_number"
    t.string "office"
    t.string "firm_id"
    t.string "salutation"
    t.string "lastname"
    t.string "firstname"
    t.string "initial"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "email"
    t.string "ship_address"
    t.string "ship_address2"
    t.string "ship_city"
    t.string "ship_state"
    t.string "ship_zip_code"
    t.string "home_address"
    t.string "home_address2"
    t.string "home_city"
    t.string "home_state"
    t.string "home_zip_code"
    t.string "phone"
    t.string "phone2"
    t.string "fax"
    t.string "mobile"
    t.string "alt_email"
    t.date "start_date"
    t.date "renew_date"
    t.date "term_date"
    t.string "salesman"
    t.string "territory"
    t.string "start_zip"
    t.string "stop_zip"
    t.decimal "prior_year_rebate", precision: 10, scale: 2, default: "0.0"
    t.decimal "advanced_rebate", precision: 10, scale: 2, default: "0.0"
    t.integer "show_exempt_collect", default: 0
    t.integer "inactive", default: 0
    t.integer "non_compliant", default: 0
    t.string "non_compliant_reason"
    t.decimal "max_collections", precision: 10, scale: 2, default: "0.0"
    t.decimal "avg_collections", precision: 10, scale: 2, default: "0.0"
    t.integer "max_coll_year"
    t.integer "max_coll_month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area", "mast", "region", "franchise_number", "office", "email", "inactive"], name: "office_index", unique: true
    t.index ["franchise_number"], name: "franchise_number"
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
    t.bigint "franchise_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["franchise_id"], name: "index_users_on_franchise_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
