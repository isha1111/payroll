class AddTimesheetIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :timesheet_id, :integer
  end
end
