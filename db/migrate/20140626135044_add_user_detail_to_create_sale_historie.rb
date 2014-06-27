class AddUserDetailToCreateSaleHistorie < ActiveRecord::Migration
  def change
       change_table :sale_histories do |t|
	      t.string :name
	      t.string :url
	      t.string :price
	      t.integer :accessory_id
	      t.string :first_name
	      t.string :last_name
	      t.string :address
	      t.string :town
	      t.string :city
	      t.string :post_code
	      t.string :telephone
	      t.string :mobile
	      t.string :email
	      t.string :dob
	      t.string :customer_note
	      t.string :purchase_date
	      t.string :serial_number
      end
  end
end
