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
      t.string :phone
      t.string :fax
      t.string :cellphone
      t.string :signer
      t.string :position
      t.string :initial_fiscal_year
      t.string :final_fiscal_year
      t.text   :digcert_data
      t.string :encrypted_passphrase
      t.string :encrypted_passphrase_iv

      t.timestamps
    end
  end
end
