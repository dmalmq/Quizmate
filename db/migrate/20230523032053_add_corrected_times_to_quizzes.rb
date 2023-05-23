class AddCorrectedTimesToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :corrected_times, :integer
  end
end
