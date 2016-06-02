class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :employee_id
      t.integer :hours
      t.integer :wage

      t.timestamps null: false
    end
  end
end
