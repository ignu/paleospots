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
__END__
Object
id: "41ca0a80f964a5209e1e1fe3"
location: Object
address: "15 S 3rd St"
cc: "US"
city: "Philadelphia"
country: "United States"
crossStreet: "btwn Market St & Chestnut St"
distance: 323
lat: 39.94969977870253
lng: -75.1457905247525
postalCode: "19106"
state: "PA"
__proto__: Object
__defineGetter__: function __defineGetter__() { [native code] }
__defineSetter__: function __defineSetter__() { [native code] }
__lookupGetter__: function __lookupGetter__() { [native code] }
__lookupSetter__: function __lookupSetter__() { [native code] }
constructor: function Object() { [native code] }
hasOwnProperty: function hasOwnProperty() { [native code] }
isPrototypeOf: function isPrototypeOf() { [native code] }
propertyIsEnumerable: function propertyIsEnumerable() { [native code] }
toLocaleString: function toLocaleString() { [native code] }
toString: function toString() { [native code] }
valueOf: function valueOf() { [native code] }
name: "FARMiCiA"
url: "http://www.farmiciarestaurant.com/"
__proto__: Object
 

