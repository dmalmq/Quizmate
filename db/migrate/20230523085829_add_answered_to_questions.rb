class AddAnsweredToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answered, :boolean, default: false
  end
end
