class QuestionPolicy < ApplicationPolicy
  # not yet needed

  def destroy?
    record.interest.user == user
  end

  def create?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
