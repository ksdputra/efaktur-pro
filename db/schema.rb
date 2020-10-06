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

ActiveRecord::Schema.define(version: 2020_06_17_051416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.integer "user_id"
    t.string "npwp"
    t.string "name"
    t.string "address"
    t.string "block"
    t.string "number"
    t.string "rt"
    t.string "rw"
    t.string "village"
    t.string "subdistrict"
    t.string "regency"
    t.string "province"
    t.string "postal_code"
    t.string "phone"
    t.boolean "is_dropdown", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nofas", force: :cascade do |t|
    t.integer "user_id"
    t.string "initial_number"
    t.string "final_number"
    t.datetime "published_date"
    t.string "last_used"
    t.boolean "is_expired", default: false
    t.boolean "is_active", default: false
    t.string "payload", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "user_id"
    t.string "code"
    t.string "name"
    t.float "price"
    t.boolean "is_dropdown", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "npwp"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "phone"
    t.string "fax"
    t.string "cellphone"
    t.string "signer"
    t.string "position"
    t.string "initial_fiscal_year"
    t.string "final_fiscal_year"
    t.text "digcert_data"
    t.string "encrypted_passphrase"
    t.string "encrypted_passphrase_iv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
