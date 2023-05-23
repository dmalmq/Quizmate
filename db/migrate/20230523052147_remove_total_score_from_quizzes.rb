class RemoveTotalScoreFromQuizzes < ActiveRecord::Migration[7.0]
  def change
    remove_column :quizzes, :total_score, :integer
  end
end
