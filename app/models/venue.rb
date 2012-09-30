class Venue
  include Mongoid::Document
  embeds_many :tips

  field :name
  field :lat
  field :lng
  field :foursquare_id
  field :location, type: Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }
  index [[ :location, Mongo::GEO2D ]]


  before_save :set_location

  def self.near(coords)
    Venue.all.to_a
  end

  private

    def set_location
      p 'set location...'
    end
end
