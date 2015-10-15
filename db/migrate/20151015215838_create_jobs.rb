class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.datetime :start
      t.datetime :end
      t.references :employer, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
