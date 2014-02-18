class Category
  include Mongoid::Document
  include Mongoid::Tree

  field :title, type: String
  field :description, type: String
  field :active, type: Boolean
end
