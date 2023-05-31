class AddRequireExpToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :total_exp, :integer, default: 100
  end
end
