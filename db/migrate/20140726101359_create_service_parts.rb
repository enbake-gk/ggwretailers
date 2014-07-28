class CreateServiceParts < ActiveRecord::Migration
  def change
    create_table :service_parts do |t|
      t.references :part, index: true
      t.references :job, index: true
      t.string :serial_number
      t.string :quantity

      t.timestamps
    end
  end
end
