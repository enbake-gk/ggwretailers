class AddSerialNumberToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :serial_number, :string
  end
end
