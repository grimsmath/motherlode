class NuggetPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
  end

  def create?
    true
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user.admin?
  end
end
