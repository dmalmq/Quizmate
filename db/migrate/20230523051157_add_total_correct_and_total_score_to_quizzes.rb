class AddTotalCorrectAndTotalScoreToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :total_correct, :integer
    add_column :quizzes, :total_score, :integer
  end
end
