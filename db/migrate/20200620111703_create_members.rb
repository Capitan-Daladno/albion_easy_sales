class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :money
      t.references :event
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
