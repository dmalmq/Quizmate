class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.boolean :corrected
      t.integer :score, default: 0
      t.boolean :answered
      t.references :user_option, foreign_key: { to_table: :options }
      t.references :question, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
