class AddCustomerIdToEquipment < ActiveRecord::Migration
  def change
    add_index :equipment, :serial_number, unique: true
  end
end
