class AddStartDateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :startDate, :date
  end
end
