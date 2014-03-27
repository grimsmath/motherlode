class NuggetPolicy < Struct.new(:user, :nugget)
  def may_moderate?
    #return true if user.admin?
    # Determine if the user is a moderator for the category.
    # TODO: Investigate if possible without instantiation to conserve memory.  Kind of hackish.
    CategoryPolicy.new(user, nugget.category).may_moderate?
  end

  def may_submit?
    user.admin? || user.approved? || Nugget.where(user: user).count < 5
  end

  def index?
    true # TODO: Should this be locked down?
  end

  def new?
    create?
  end

  def create?
    may_submit?
  end

  def show?
    nugget.approved? || may_moderate?
  end

  def edit?
    update?
  end

  def update?
    may_moderate?
  end

  def destroy?
    may_moderate?
  end

  def unapprove?
    may_moderate?
  end

  def approve?
    may_moderate?
  end
end
