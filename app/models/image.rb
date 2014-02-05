class Image < Content
  include Mongoid::Document

  field :title, type: String
  field :caption, type: String
  field :content, type: BSON::Binary

  def content= (value)
  	self[:content] = BSON::Binary.new value.read
  end
end