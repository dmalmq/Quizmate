class RemoveCorrectFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :correct, :boolean
  end
end
