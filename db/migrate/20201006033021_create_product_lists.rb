class CreateProductLists < ActiveRecord::Migration[6.0]
  def change
    create_table :product_lists do |t|
      t.integer :sales_invoice_id
      t.string :code
      t.string :name
      t.float :price
      t.float :amount
      t.float :discount
      t.float :total_price
      t.float :dpp
      t.float :ppn
      t.integer :ppnbm_rate
      t.float :ppnbm

      t.timestamps
    end
  end
end
