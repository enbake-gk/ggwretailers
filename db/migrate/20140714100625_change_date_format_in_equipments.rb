class ChangeDateFormatInEquipments < ActiveRecord::Migration
  def up
  	remove_column :equipment, :purchase_date
    add_column :equipment, :purchase_date, :date
  end
  def down
  	remove_column :equipment, :purchase_date
    add_column :equipment, :purchase_date, :string
  end
end
