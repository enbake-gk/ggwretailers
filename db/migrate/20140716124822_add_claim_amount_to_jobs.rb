class AddClaimAmountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :claim_amount, :string
  end
end
