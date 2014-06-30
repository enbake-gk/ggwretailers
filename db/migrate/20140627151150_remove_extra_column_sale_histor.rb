class RemoveExtraColumnSaleHistor < ActiveRecord::Migration
  def change
  	remove_column :sale_histories, :url
  	remove_column :sale_histories, :equipment_id
  end
end
