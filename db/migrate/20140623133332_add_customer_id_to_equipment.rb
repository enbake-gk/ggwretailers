class AddCustomerIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :customer_id, :integer
    add_column :equipment, :serial_number, :string
    add_index :equipment, :serial_number, unique: true
  end
end
