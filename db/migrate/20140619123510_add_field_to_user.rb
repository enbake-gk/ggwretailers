class AddFieldToUser < ActiveRecord::Migration
   change_table(:users) do |t|
  	t.string :first_name
  	t.string :last_name
  	t.string :contact_person
  	t.string :website
  	t.belongs_to :retailer_group
  	t.integer :role_id
  end
   add_index :users, :retailer_group_id
end

	
