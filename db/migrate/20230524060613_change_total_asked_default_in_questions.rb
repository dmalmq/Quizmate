class ChangeTotalAskedDefaultInQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column_default :questions, :total_asked, from: nil, to: 0
  end
end
