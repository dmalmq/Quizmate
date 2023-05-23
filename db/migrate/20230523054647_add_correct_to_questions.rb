class AddCorrectToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :correct, :boolean
  end
end
