class CreateSalesInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_invoices do |t|
      t.integer :user_id
      t.integer :fk_id
      t.string :npwp
      t.string :name
      t.string :address
      t.string :detail_transaction_code
      t.string :detail_transaction
      t.string :additional_information_code
      t.string :additional_information
      t.string :tax_type_code
      t.string :tax_type
      t.string :nofa
      t.datetime :document_date
      t.string :tax_periode
      t.string :tax_year
      t.string :faktur_status_code
      t.string :faktur_status
      t.integer :total_dpp, limit: 8
      t.integer :total_ppn, limit: 8
      t.integer :total_ppnbm, limit: 8
      t.integer :uang_muka_code
      t.integer :uang_muka_dpp, limit: 8
      t.integer :uang_muka_ppn, limit: 8
      t.integer :uang_muka_ppnbm, limit: 8
      t.string :approval_status_code
      t.string :approval_status
      t.datetime :approval_date
      t.string :description
      t.string :signer
      t.text :reference
      t.string :user_perekam
      t.datetime :tanggal_rekam
      t.string :user_pengubah
      t.datetime :tanggal_ubah

      t.timestamps
    end
  end
end
