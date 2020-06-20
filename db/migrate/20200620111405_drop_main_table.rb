class DropMainTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :controllers
  end
end
