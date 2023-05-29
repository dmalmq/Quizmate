class ChallengePolicy < ApplicationPolicy

  def show? # for the questions pages in a quiz
    true
  end

  def update?
    record.quiz.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end
end
