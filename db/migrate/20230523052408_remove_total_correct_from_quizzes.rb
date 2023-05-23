class RemoveTotalCorrectFromQuizzes < ActiveRecord::Migration[7.0]
  def change
    remove_column :quizzes, :total_correct, :integer
  end
end
