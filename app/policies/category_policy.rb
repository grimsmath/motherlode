class CategoryPolicy < Struct.new(:user, :category)
  def may_moderate?
    # Catch admin here
    return true if user.admin?
    category.ancestors_and_self.each do |category|
      return true if category.moderators.include? user
    end
    false
  end

  def may_admin?
    user.admin?
  end

  def create?
    may_admin?
  end

  def new?
    may_admin?
  end

  def edit?
    may_admin?
  end

  def update?
    may_admin?
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    may_admin?
  end

  def new_subcategory?
    new?
  end
end
