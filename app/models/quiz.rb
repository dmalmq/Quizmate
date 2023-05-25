class Quiz < ApplicationRecord
  belongs_to :user
  has_many :challenges
  has_many :questions, through: :challenges
  attribute :total_points, :integer, default: 0
end
