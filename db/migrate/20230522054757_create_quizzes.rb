class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.integer :number_of_questios
      t.integer :result
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
