class Category
  include Mongoid::Document
  include Mongoid::Tree

  has_many :nuggets
  has_and_belongs_to_many :moderators, class_name: 'User'

  field :title, type: String
  field :description, type: String
  field :active, type: Boolean

  def indented_title
    '--' * ancestors.count + ' ' + title
  end

  def awaiting_nuggets
    Nugget.awaiting.where(:category => id)
  end

  def approved_nuggets
    Nugget.approved.where(:category => id)
  end
end