class AddScoreToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :score, :integer, default: 0
  end
end
