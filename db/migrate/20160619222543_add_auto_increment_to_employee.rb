class AddAutoIncrementToEmployee < ActiveRecord::Migration
  def change
     execute "ALTER SEQUENCE employees_id_seq RESTART 1000"
  end
end
