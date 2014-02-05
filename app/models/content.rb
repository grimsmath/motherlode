class Content
  include Mongoid::Document
  embedded_in :nugget


  field :name, type: String
  field :content, type: String
end
