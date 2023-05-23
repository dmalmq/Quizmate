class Quiz < ApplicationRecord
  belongs_to :user
  attribute :corrected_times, :integer, default: 0
end
