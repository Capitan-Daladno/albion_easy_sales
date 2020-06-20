class DeleteUsersAndEvents < ActiveRecord::Migration[6.0]
  def change
    drop_table :users_and_events
  end
end
