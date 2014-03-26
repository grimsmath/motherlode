class NuggetPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
  end

  def create?
    user.admin? || user.approved? || Nugget.where(user: user).count < 5
  end

  def new?
    user.admin? || user.approved? || Nugget.where(user: user).count < 5
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

  def approve?
    user.admin?
  end

  def unapprove?
    approve?
  end
end
