class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :url
      t.integer :price
      t.references :user, index: true
      t.references :brand, index: true
      t.references :model, index: true
      t.references :accessory, index: true
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :town
      t.string :city
      t.integer :post_code
      t.integer :telephone
      t.integer :mobile
      t.string :email
      t.datetime :dob
      t.text :customer_note
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
