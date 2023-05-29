class Question < ApplicationRecord
  before_destroy :remove_options
  belongs_to :interest
  belongs_to :correct_option, class_name: "Option", foreign_key: "correct_option_id", optional: true
  has_many :options, dependent: :destroy
  has_many :challenges, dependent: :destroy
  # belongs_to :quiz, optional: true
  # has_many :quiz, through: :challenges
  # belongs_to :user_option, class_name: "Option", optional: true
  # validates :score, numericality: { greater_than_or_equal_to: 0 }


  def remove_options
    self.correct_option_id = nil
    self.save!
    self.challenges.each do |challenge|
      challenge.user_option_id = nil
      challenge.save!
    end
  end
end

LETTERS = ["A. ", "B. ", "C. ", "D. "]
