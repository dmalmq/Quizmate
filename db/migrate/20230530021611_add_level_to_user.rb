class AddLevelToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :level, :integer, default: 0
    add_column :users, :experience, :integer, default: 0
  end
end
