class AddTotalPointsToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :total_points, :integer
  end
end
