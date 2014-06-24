class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.references :brand, index: true
      t.string :name
      t.string :color
      t.string :manufacturer
      t.string :warranty
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
