class Question < ApplicationRecord
  belongs_to :interest
  belongs_to :quiz
  belongs_to :correct_option, class_name: "Option", optional: true
  belongs_to :user_option, class_name: "Option", optional: true
  has_many :options
end
