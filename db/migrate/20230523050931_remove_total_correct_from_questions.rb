class RemoveTotalCorrectFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :total_correct, :integer
  end
end
