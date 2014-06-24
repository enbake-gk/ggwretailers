class CreateAccessoriesmodels < ActiveRecord::Migration
  def change
    create_table :accessoriesmodels do |t|
      t.references :model, index: true
      t.references :accessory, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
