class Tip
  attr_accessor :lat, :long
  include Mongoid::Document

  #TODO: validations

  field :text
  field :venue_name
  field :foursquare_id
  field :location, type: Array

  index [[ :location, Mongo::GEO2D ]]

  before_save :set_location

  private

    def set_location
      p lat
      p long
    end
end
