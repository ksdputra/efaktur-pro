class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :npwp
      t.string :name
      t.string :address
      t.string :block
      t.string :number
      t.string :rt
      t.string :rw
      t.string :village
      t.string :subdistrict
      t.string :regency
      t.string :province
      t.string :postal_code
      t.string :phone
      t.boolean :is_dropdown, default: false

      t.timestamps
    end
  end
end
