class NuggetPolicy < Struct.new(:user, :nugget)
  def may_moderate?
    # return true if user.admin?
    nugget.category.ancestors_and_self.each do |category|
      return true if category.moderators.include? user
    end
    false
  end

  def may_submit?
    user.admin? || user.approved? || Nugget.where(user: user).count < 5
  end

  def index?
    true
  end

  def show?
    nugget.approved? || may_moderate?
  end
end
