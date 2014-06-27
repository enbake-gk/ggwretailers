class ChangeDataTypeOfSaleHistory < ActiveRecord::Migration
  def change
  	change_column :sale_histories, :dob, :datetime
  end
end
