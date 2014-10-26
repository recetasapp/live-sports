require "spec_helper"


describe "Sport index" do

  it "should show an error if no data was fetched from the API" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return false

    visit sports_path :en
    expect(page).to have_content "Could not retreive data from network! Try again later."
  end


  it "should show the list of sports" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    visit sports_path :en

    within "tr#sport_id_1" do
      expect(page).to have_link "Football", href: sport_path(:en, 1)
    end
    within "tr#sport_id_2" do
      expect(page).to have_link "Horse Racing", href: sport_path(:en, 2)
    end
    within "tr#sport_id_3" do
      expect(page).to have_link "Tennis", href: sport_path(:en, 3)
    end
  end

end
