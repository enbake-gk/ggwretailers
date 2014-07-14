class ChangeDateFormatInEquipments < ActiveRecord::Migration
  def change
  	change_column :equipment, :purchase_date, :date
  end
end
