class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    scope.all
    end
  end

  def update?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def bookmark?
    true
  end

  def destroy?
    true
  end
end
  