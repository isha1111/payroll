class AddEndTimeToTimesheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :endTime, :time
  end
end
