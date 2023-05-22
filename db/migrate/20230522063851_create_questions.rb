class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :streak
      t.integer :total_asked
      t.datetime :last_asked
      t.references :correct_option, foreign_key: { to_table: :options }
      t.references :user_option, foreign_key: { to_table: :options }
      t.references :interest, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
