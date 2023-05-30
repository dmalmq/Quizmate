class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events
  has_many :achievements, through: :events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def add_to_day_streak(user)
  #   user.day_streak += 1
  # end

  # def add_to_completed_quizzes
  #   self.completed_quizzes += 1
  # end

  # def add_to_correct_questions
  #   self.correct_questions += 1
  # end

end
