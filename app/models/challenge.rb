class Challenge < ApplicationRecord
  belongs_to :question
  belongs_to :quiz
  belongs_to :user_option, class_name: "Option", foreign_key: "user_option_id", optional: true
  validates :score, numericality: { greater_than_or_equal_to: 0 }
end
