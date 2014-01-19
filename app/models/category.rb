class Category
  include Mongoid::Document
  include Mongoid::Tree

  field :title, type: String
end
