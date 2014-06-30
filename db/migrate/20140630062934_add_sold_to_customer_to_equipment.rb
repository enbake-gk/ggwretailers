class AddSoldToCustomerToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :sold_to_customer, :boolean, :default => false
    add_column :equipment, :sold_to_retailer, :boolean, :default => false
  end
end
