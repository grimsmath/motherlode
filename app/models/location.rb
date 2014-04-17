class Location < Content
  include Mongoid::Document

  field :address, type: String
  field :latitude, type: Float
  field :longitude, type: Float
end