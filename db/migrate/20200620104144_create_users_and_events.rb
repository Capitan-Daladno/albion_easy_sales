class CreateUsersAndEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :users_and_events, id: false do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
