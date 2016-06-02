class AddEmployeeIdToTimesheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :employee_id, :integer
  end
end
