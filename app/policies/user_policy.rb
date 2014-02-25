class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def show?
    true
  end

  def update?
    @user.admin? || @user == @record
  end

  def destroy?
    @user.admin?
  end

  def approve?
    @user.admin?
  end

  def unapprove?
    @user.admin?
  end

  def make_admin?
    @user.admin?
  end

  def strip_admin?
    @user.admin?
  end

  def update_password?
    @user.admin? || @user == @record
  end
end
