class AddSiteIdToTimesheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :site_id, :Integer
  end
end
