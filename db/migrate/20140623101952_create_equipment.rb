class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :url
      t.string :price
      t.references :user, index: true
      t.references :brand, index: true
      t.references :model, index: true
      t.integer :accessory_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :town
      t.string :city
      t.string :post_code
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :dob
      t.string :customer_note
      t.string :purchase_date
      t.integer :customer_id
      t.string :serial_number
      t.timestamps
    end
  end
end
