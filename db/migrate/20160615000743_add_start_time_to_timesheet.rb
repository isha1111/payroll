class AddStartTimeToTimesheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :startTime, :time
  end
end
