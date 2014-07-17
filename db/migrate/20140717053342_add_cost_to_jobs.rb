class AddCostToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :cost, :string
  end
end
