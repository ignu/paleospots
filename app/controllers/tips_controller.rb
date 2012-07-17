class TipsController < ApplicationController
  def local
    foursquare = Foursquare.new
    tips = foursquare.tips(params[:q], params[:lat], params[:long])
    render json: tips.to_json
  end

  def create
    @tip = Tip.create params[:tip]
    render json: @tip.to_json
  end

  def index

  end
end
