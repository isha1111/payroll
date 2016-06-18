class DeleteTimesheetIdFromSite < ActiveRecord::Migration
  def change
    remove_column :sites, :timesheet_id
  end
end
