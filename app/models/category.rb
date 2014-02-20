class Category
  include Mongoid::Document
  include Mongoid::Tree

  has_many :nuggets

  field :title, type: String
  field :description, type: String
  field :active, type: Boolean

  def indented_title
    '..' * ancestors.count + title
  end
end