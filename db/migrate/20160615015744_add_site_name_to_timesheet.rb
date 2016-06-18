class AddSiteNameToTimesheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :site_name, :string
  end
end
