require "spec_helper"


describe "Sport index" do

  it "should show an error if no data was fetched from the API" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return false

    visit sports_path :es
    expect(page).to have_content "No fue posible obtener datos de la red! Por favor, intentalo mas tarde."
  end


  it "should show the list of sports" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    visit sports_path :es

    within "tr#sport_id_1" do
      expect(page).to have_link "Football", href: sport_path(:es, 1)
    end
    within "tr#sport_id_2" do
      expect(page).to have_link "Horse Racing", href: sport_path(:es, 2)
    end
    within "tr#sport_id_3" do
      expect(page).to have_link "Tennis", href: sport_path(:es, 3)
    end
  end

end
