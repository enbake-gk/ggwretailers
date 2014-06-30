class AddEquipmentIdToSaleHistory < ActiveRecord::Migration
  def change
    add_reference :sale_histories, :equipment, index: true
  end
end
