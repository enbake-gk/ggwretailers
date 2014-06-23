class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
