class Challenge < ApplicationRecord
  # before_update :detach_options
  belongs_to :quiz
  belongs_to :question

  belongs_to :user_option, class_name: "Option", foreign_key: "user_option_id", optional: true, dependent: :destroy
  validates :score, numericality: { greater_than_or_equal_to: 0 }

  # def detach_options
  #   raise
  # end
end
