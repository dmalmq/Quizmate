class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  attribute :total_points, :integer, default: 0
end
