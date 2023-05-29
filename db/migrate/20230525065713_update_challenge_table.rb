class UpdateChallengeTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :challenges, :answered, false
  end
end
