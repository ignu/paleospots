require 'spec_helper'

describe TipsController do
  describe "POST #create" do
    before do
      Venue.delete_all
      post :create, { tip: { text: "horrible place", venue: { name: "Burger King", foursquare_id: "12903"} } }
    end

    it "creates a tip" do
      response.should be_success
      venue = Venue.first
      venue.name.should == "Burger King"
      tip = venue.tips.first
      tip.text.should == "horrible place"
    end

    it "doesn't duplicate venues when same foursquare id" do
      post :create, { tip: { text: "good place", venue: { name: "Burger King", foursquare_id: "12903"} } }
      Venue.count.should == 1
    end
  end
end
