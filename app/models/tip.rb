class Tip
  include Mongoid::Document
  field :text
  field :location, type: Array

  index [[ :location, Mongo::GEO2D ]]

  before_save :set_location
end
