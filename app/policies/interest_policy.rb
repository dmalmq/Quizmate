class InterestPolicy < ApplicationPolicy
  def show?
    record.user == user
  end

  def create?
    user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!

    def resolve
      scope.where(user: user)
    end
  end
end
