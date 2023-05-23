class RenameNumberOfQuestionInQuizName < ActiveRecord::Migration[7.0]
  def change
    rename_column :quizzes, :number_of_questios, :number_of_question
  end
end
