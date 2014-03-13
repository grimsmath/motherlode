class Category
  include Mongoid::Document
  include Mongoid::Tree

  has_many :nuggets

  field :title, type: String
  field :description, type: String
  field :active, type: Boolean

  def indented_title
    '--' * ancestors.count + ' ' + title
  end

  def descendants_and_self_nuggets
    Nugget.where(:category.in => descendants_and_self.to_a)
    # TODO: Performance test above vs:
    #arr = []
    #descendants_and_self.each do |category|
    #  arr << category.nuggets
    #end
    #arr
  end

  def descendants_nuggets
    Nugget.where(:category.in => descendants.to_a)
    # TODO: Benchmark this
  end
end