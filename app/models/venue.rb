class Venue
  include Mongoid::Document
  embeds_many :tips

  field :name
  field :foursquare_id
  field :location, type: Array
  index [[ :location, Mongo::GEO2D ]]


  before_save :set_location

  private

    def set_location
      p 'SET LOCATION HERE ' * 22
    end
end
