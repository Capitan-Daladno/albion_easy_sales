class DefaultMoney < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :money, :integer, default: 0
  end
end
