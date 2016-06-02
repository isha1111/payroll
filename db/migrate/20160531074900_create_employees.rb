class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :dob
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
