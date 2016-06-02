class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.decimal :hours

      t.timestamps null: false
    end
  end
end
