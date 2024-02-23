class AddUserToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :user_id, :integer
  end
end
