class CreateNofas < ActiveRecord::Migration[6.0]
  def change
    create_table :nofas do |t|
      t.integer :user_id
      t.string :initial_number
      t.string :final_number
      t.datetime :published_date
      t.string :last_used
      t.boolean :is_expired, default: false
      t.boolean :is_active, default: false
      t.string :file_path

      t.timestamps
    end
  end
end
