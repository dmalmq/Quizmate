class Interest < ApplicationRecord

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions
  has_many :challenges, through: :questions
  validates :name, presence: true
  after_create :generate_questions

  def generate_questions
    FakeJob.perform_later(self)
  end

  def corrected_percentage
    @total_challenges = challenges.count
    @answered = challenges.where(corrected: true).count
    ((@answered.to_f / @total_challenges) * 100).round(2)
  end
end
