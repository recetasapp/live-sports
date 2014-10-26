require "spec_helper"


describe "Event view" do

  it "should show an error if no data was fetched from the API" do
    sport_id = 1
    event_id = 11

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return false

    visit sport_event_path :en, sport_id, event_id
    expect(page).to have_content "Could not retreive data from network! Try again later."
  end


  it "should show an error if the sport id was not found" do
    not_existing_sport_id = 5
    event_id = 11

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    visit sport_event_path :en, not_existing_sport_id, event_id
    expect(page).to have_content "Could not found the requested data. Maybe the market is no longer available. Try with a different one."
  end


  it "should show an error if the event was not found" do
    sport_id = 1
    not_existing_event_id = 15

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    visit sport_event_path :en, sport_id, not_existing_event_id
    expect(page).to have_content "Could not found the requested data. Maybe the market is no longer available. Try with a different one."
  end


  it "should show the outcomes for the selected event" do
    sport_id = 2
    event_id = 21

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).exactly(3).times.and_return DATA

    visit root_path :en
    click_link "List of Sports"
    click_link "Horse Racing"
    click_link "RAFAL (Spain) 12:00"

    expect(page).to have_content "Outcomes for RAFAL (Spain) 12:00"

    within "tr#outcome_id_211" do
      expect(page).to have_content "CABEZA HUECA"
      expect(page).to have_content "9/1"
    end
    within "tr#outcome_id_212" do
      expect(page).to have_content "RAUDO"
      expect(page).to have_content "15/2"
    end
    within "tr#outcome_id_213" do
      expect(page).to have_content "VELOZ"
      expect(page).to have_content "28/1"
    end
  end

end
