class ChangeDataTypeOfSaleHistory < ActiveRecord::Migration
  def change
  	remove_column :sale_histories, :dob
  	change_column :sale_histories, :dob, :datetime
  end
end
