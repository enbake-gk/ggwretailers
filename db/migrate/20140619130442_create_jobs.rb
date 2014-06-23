class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.datetime :date_of_job
      t.text :service_notes
      t.string :time_spent
      t.string :claimed
      t.string :warrenty_job
      t.string :servicetech

      t.timestamps
    end
  end
end
