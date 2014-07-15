class AddColumnIsRegisteredToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :is_registered, :boolean
  end
end
