require 'spec_helper'

describe Venue do
  let(:venue) { create(:venue) }

  it "has many tips" do
    venue.name.should == "Ponderosa"
    venue.tips << build(:tip)
    venue.save
    venue.tips.count.should == 2
  end
end
