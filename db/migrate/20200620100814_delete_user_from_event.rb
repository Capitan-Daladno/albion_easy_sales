class DeleteUserFromEvent < ActiveRecord::Migration[6.0]
  def change
    def self.down
      remove_column :events, :user
    end
  end
end
