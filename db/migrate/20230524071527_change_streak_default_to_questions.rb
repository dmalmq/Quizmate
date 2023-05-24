class ChangeStreakDefaultToQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column_default :questions, :streak, from: nil, to: 0
  end
end
