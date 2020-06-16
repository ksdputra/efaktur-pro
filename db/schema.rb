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

ActiveRecord::Schema.define(version: 2020_06_16_040115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "npwp"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "phone_number"
    t.string "fax_number"
    t.string "cellphone_number"
    t.string "signer"
    t.string "position"
    t.string "initial_fiscal_year"
    t.string "final_fiscal_year"
    t.text "digcert_data"
    t.string "encrypted_p12_passphrase"
    t.string "encrypted_p12_passphrase_iv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
