class FoursquareVenuesController < ApplicationController
  def index
    foursquare = Foursquare.new
    venues = foursquare.venues(params[:lat], params[:long], params[:q])
    render json: venues.to_json
  end
end
