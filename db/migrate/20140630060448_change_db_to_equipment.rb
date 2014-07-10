class ChangeDbToEquipment < ActiveRecord::Migration
  def change
  	remove_column :equipment, :dob
  	add_column :equipment, :dob, :datetime
  end
end
