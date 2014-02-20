class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
