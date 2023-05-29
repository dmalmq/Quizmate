class QuizPolicy < ApplicationPolicy

  def show? # for the quiz result page
    true
  end

  def create? # for starting the quiz
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end
end
