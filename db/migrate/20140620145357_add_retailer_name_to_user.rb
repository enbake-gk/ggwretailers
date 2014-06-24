class AddRetailerNameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :retailer_name, :string
  	add_column :users, :phone_number, :integer
  end
end
