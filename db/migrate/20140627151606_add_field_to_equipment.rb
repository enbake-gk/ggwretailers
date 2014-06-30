class AddFieldToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :retailer_id, :integer
  end
end
