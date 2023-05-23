class AddScoreAndTotalCorrectToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :score, :integer
    add_column :questions, :total_correct, :integer
  end
end
