class AddSellingDateToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :selling_date, :datetime
  end
end
