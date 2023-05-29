class Question < ApplicationRecord
  belongs_to :interest
  # belongs_to :quiz, optional: true
  belongs_to :correct_option, class_name: "Option", foreign_key: "correct_option_id", optional: true
  has_many :quiz, through: :challenges
  # belongs_to :user_option, class_name: "Option", optional: true
  has_many :options, dependent: :destroy
  has_many :challenges, dependent: :destroy
  # validates :score, numericality: { greater_than_or_equal_to: 0 }
end

LETTERS = ["A. ", "B. ", "C. ", "D. "]
