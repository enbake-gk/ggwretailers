class AddColoumToUsers < ActiveRecord::Migration
  def change
	add_column :users, :address, :string
  	add_column :users, :town, :string
  	add_column :users, :city, :string
  	add_column :users, :post_code, :string
  	add_column :users, :mobile, :string
  	add_column :users, :dob, :date
  	add_column :users, :customer_note, :string
  	add_column :users, :gender, :string
  end
end
