class SetCorrectedDefaultValueToChallengeTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :challenges, :corrected, false
  end
end
