class Venue
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  embeds_many :tips

  field :name
  field :lat
  field :lng
  field :foursquare_id
  field :coordinates, type: Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }
  index [[ :coordinates, Mongo::GEO2D ]]

  before_save :set_coordinates

  private

    def set_coordinates
    end
end
