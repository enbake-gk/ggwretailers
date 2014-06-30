class ChangeDbToEquipment < ActiveRecord::Migration
  def change
  	change_column :equipment, :dob, :datetime
  end
end
