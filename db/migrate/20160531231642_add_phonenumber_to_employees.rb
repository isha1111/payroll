class AddPhonenumberToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :PhoneNumber, :string
  end
end
