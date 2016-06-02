class AddDayToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :day, :date
  end
end
