class AddEmailIdToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :email_id, :string
  end
end
