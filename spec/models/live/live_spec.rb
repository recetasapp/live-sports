require "spec_helper"


describe Live do

  it "should have a constant for the api link" do
    expect(Live::API_URL).to eq "http://www.betvictor.com/live/en/live/list.json"
  end

end
