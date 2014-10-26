require "spec_helper"


describe "sport method" do

  it "should raise a not_found exception if sport was not found" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    not_existing_sport_id = 5

    expect(lambda{Live.instance.sport(not_existing_sport_id)}).to raise_error NotFoundException
  end

  it "should return the sport and a list of its events sorted by attribute pos" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    sport_id = 1

    sport = Live.instance.sport sport_id
    expect(sport[:id]).to eq sport_id
    expect(sport[:events][1][:pos]).to be >= sport[:events][0][:pos]
    expect(sport[:events][2][:pos]).to be >= sport[:events][1][:pos]
  end

end
