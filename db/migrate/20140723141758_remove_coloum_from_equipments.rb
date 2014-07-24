class RemoveColoumFromEquipments < ActiveRecord::Migration
  def change
  	remove_column :equipment, :address
  	remove_column :equipment, :town
  	remove_column :equipment, :city
  	remove_column :equipment, :post_code
  	remove_column :equipment, :mobile
  	remove_column :equipment, :dob
  	remove_column :equipment, :customer_note
  end
end
