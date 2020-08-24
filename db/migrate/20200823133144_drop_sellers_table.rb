class DropSellersTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :sellers
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
