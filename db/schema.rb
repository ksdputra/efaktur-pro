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

ActiveRecord::Schema.define(version: 2020_10_06_033021) do

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

  create_table "product_lists", force: :cascade do |t|
    t.integer "sales_invoice_id"
    t.string "code"
    t.string "name"
    t.float "price"
    t.float "amount"
    t.float "discount"
    t.float "total_price"
    t.float "dpp"
    t.float "ppn"
    t.integer "ppnbm_rate"
    t.float "ppnbm"
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

  create_table "sales_invoices", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fk_id"
    t.string "npwp"
    t.string "name"
    t.string "address"
    t.string "detail_transaction_code"
    t.string "detail_transaction"
    t.string "additional_information_code"
    t.string "additional_information"
    t.string "tax_type_code"
    t.string "tax_type"
    t.string "nofa"
    t.datetime "document_date"
    t.string "tax_periode"
    t.string "tax_year"
    t.string "faktur_status_code"
    t.string "faktur_status"
    t.bigint "total_dpp"
    t.bigint "total_ppn"
    t.bigint "total_ppnbm"
    t.integer "uang_muka_code"
    t.bigint "uang_muka_dpp"
    t.bigint "uang_muka_ppn"
    t.bigint "uang_muka_ppnbm"
    t.string "approval_status_code"
    t.string "approval_status"
    t.datetime "approval_date"
    t.string "description"
    t.string "signer"
    t.text "reference"
    t.string "user_perekam"
    t.datetime "tanggal_rekam"
    t.string "user_pengubah"
    t.datetime "tanggal_ubah"
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
