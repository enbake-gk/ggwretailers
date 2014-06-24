class CreateSaleHistories < ActiveRecord::Migration
  def change
    create_table :sale_histories do |t|
      t.references :equipment, index: true
      t.integer :serial_no
      t.references :brand, index: true
      t.references :model, index: true
      t.integer :customer_id
      t.datetime :selling_date

      t.timestamps
    end
  end
end
