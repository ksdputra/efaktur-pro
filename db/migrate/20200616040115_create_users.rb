class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :npwp
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone_number
      t.string :fax_number
      t.string :cellphone_number
      t.string :signer
      t.string :position
      t.string :initial_fiscal_year
      t.string :final_fiscal_year
      t.text   :digcert_data
      t.string :encrypted_p12_passphrase
      t.string :encrypted_p12_passphrase_iv

      t.timestamps
    end
  end
end
