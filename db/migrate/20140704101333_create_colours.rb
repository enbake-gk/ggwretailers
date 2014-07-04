class CreateColours < ActiveRecord::Migration
  def change
    create_table :colours do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
