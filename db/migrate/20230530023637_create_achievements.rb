class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :text
      t.string :deliverable
      t.integer :target
      t.string :icon

      t.timestamps
    end
  end
end
