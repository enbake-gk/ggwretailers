class AddColourIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :colour_id, :integer
  end
end
