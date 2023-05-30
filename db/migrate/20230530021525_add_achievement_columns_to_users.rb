class AddAchievementColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :day_streak, :integer, default: 0
    add_column :users, :completed_quizzes, :integer, default: 0
    add_column :users, :correct_questions, :integer, default: 0
  end
end
