class UpdateQuestionTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :score, :integer
    remove_column :questions, :answered, :boolean
    remove_column :questions, :corrected, :boolean
    remove_reference :questions, :quiz, index: true, foreign_key: true
    remove_reference :questions, :user_option, index: true, foreign_key: { to_table: :options }
  end
end
