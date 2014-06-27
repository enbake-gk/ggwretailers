class RemoveExtraColumnSaleHistory < ActiveRecord::Migration
  def change
  	remove_column :sale_histories, :serial_number
  	remove_column :sale_histories, :purchase_date
  	remove_column :sale_histories, :customer_note
  	remove_column :sale_histories, :dob
  	remove_column :sale_histories, :email
  	remove_column :sale_histories, :mobile
  	remove_column :sale_histories, :telephone
  	remove_column :sale_histories, :post_code
  	remove_column :sale_histories, :city
  	remove_column :sale_histories, :town
  	remove_column :sale_histories, :address
  	remove_column :sale_histories, :first_name
  	remove_column :sale_histories, :last_name
  	remove_column :sale_histories, :accessory_id
  	remove_column :sale_histories, :price
  	remove_column :sale_histories, :name
  	remove_column :sale_histories, :customer_id
  end
end
