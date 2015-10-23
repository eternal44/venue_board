class ChangeTimeColumnsInJobs < ActiveRecord::Migration
  def change
    rename_column(:jobs, :start, :start_time)
    rename_column(:jobs, :end, :end_time)
  end
end
