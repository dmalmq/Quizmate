class RemoveQuizNullFalseFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questions, :quiz
    add_reference :questions, :quiz, null: true, foreign_key: true
  end
end
