class RemoveScoreFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :score, :integer
  end
end
