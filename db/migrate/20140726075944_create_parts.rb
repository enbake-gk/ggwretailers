class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.references :model, index: true
      t.string :name
      t.string :barcode

      t.timestamps
    end
  end
end
