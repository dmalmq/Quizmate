class AddIndexInQuizToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :index_in_quiz, :integer, default: 0
  end
end
