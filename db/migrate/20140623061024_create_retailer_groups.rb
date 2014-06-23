class CreateRetailerGroups < ActiveRecord::Migration
  def change
    create_table :retailer_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
