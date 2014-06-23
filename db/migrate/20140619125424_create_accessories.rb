class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :name
      t.string :url
      t.string :price
      t.references :user, index: true
      t.references :model,index: :true

      t.timestamps
    end
  end
end
