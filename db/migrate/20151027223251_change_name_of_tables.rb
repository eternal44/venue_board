class ChangeNameOfTables < ActiveRecord::Migration
  def change
    rename_table(:jobs, :events)
  end
end
