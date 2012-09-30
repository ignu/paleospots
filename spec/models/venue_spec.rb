require 'spec_helper'

describe Venue do
  let(:venue) { create(:venue) }

  it "has many tips" do
    venue.name.should == "Ponderosa"
    venue.tips << build(:tip)
    venue.save
    venue.tips.count.should == 1
  end

  describe ".near" do
    let(:coords) { rite_aid }
    let!(:venue) { create(:venue, coords) }

    it "returns nearby venues" do
      Venue.near(indy_hall).should include venue
    end
  end
end
