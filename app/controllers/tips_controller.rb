class TipsController < ApplicationController
  def local
    foursquare = Foursquare.new
    tips = foursquare.tips(params[:q], params[:lat], params[:long])
    render json: tips.to_json
  end

  def create
    @venue = find_or_create_venue params[:tip].delete(:venue)
    @venue.tips << Tip.new(params[:tip])
    @venue.save!
    render json: @tip.to_json
  end


  def index
  end

  private

    def find_or_create_venue(venue_params)
      venue =  Venue.where(:foursquare_id => venue_params[:foursquare_id]).first
      if venue
        venue.update_attributes venue_params
      else
        venue = Venue.create(venue_params)
      end
      venue
    end
end
