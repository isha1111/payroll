class DeleteSiteIdFromEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :site_id
  end
end
