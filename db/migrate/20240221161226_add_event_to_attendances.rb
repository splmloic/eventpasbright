class AddEventToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :event_id, :integer
  end
end
