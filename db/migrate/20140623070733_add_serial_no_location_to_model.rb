class AddSerialNoLocationToModel < ActiveRecord::Migration
  def change
    add_column :models, :serial_no_location, :string
  end
end
