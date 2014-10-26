require "spec_helper"


describe "sport_event method" do

  it "should raise a not_found exception if sport was not found" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    not_existing_sport_id = 5
    event_id = 11

    expect(lambda{Live.instance.sport_event(not_existing_sport_id, event_id)}).to raise_error NotFoundException
  end

  it "should raise a not_found exception if event was not found" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    sport_id = 1
    not_existing_event_id = 41

    expect(lambda{Live.instance.sport_event(sport_id, not_existing_event_id)}).to raise_error NotFoundException
  end

  it "should return the event and a list of its outcomes" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    sport_id = 1
    event_id = 11

    sport = Live.instance.sport_event sport_id, event_id
    expect(sport[:id]).to eq sport_id
    expect(sport[:event][:id]).to eq event_id
    expect(sport[:event][:outcomes]).to be_an Array
    expect(sport[:event][:outcomes].size).to be 3
  end

end
