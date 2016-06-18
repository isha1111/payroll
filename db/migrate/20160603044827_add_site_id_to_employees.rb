class AddSiteIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :site_id, :integer
  end
end
