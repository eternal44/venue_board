class ChangeStartAndEndTimesOnJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :start, :text
    change_column :jobs, :end, :text
  end
end
