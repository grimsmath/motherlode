class UserPolicy < Struct.new(:user, :resource)
  # Ambiguous parameters-- :user is current_user, :resource is an instance of User model

  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user.admin? || user == resource
  end

  def destroy?
    user.admin?
  end

  def approve?
    user.admin?
  end

  def unapprove?
    user.admin?
  end

  def promote_admin?
    user.admin?
  end

  def demote_admin?
    user.admin?
  end
end
