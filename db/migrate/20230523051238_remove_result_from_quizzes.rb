class RemoveResultFromQuizzes < ActiveRecord::Migration[7.0]
  def change
    remove_column :quizzes, :result, :string
  end
end
