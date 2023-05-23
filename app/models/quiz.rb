class Quiz < ApplicationRecord
  belongs_to :user
  attribute :total_points, :integer, default: 0
end
