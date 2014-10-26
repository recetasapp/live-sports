require "spec_helper"


describe "Sport view" do

  it "should show an error if no data was fetched from the API" do
    sport_id = 1

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return false

    visit sport_path :es, sport_id
    expect(page).to have_content "No fue posible obtener datos de la red! Por favor, intentalo mas tarde."
  end


  it "should show an error if the sport id was not found" do
    not_existing_sport_id = 5

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    visit sport_path :es, not_existing_sport_id
    expect(page).to have_content "No se encontraron los datos solicitados. Posiblemente el mercado ya no se encuentre disponible. Pruebe con otro diferente."
  end


  it "should show the events for the selected sport" do
    sport_id = 1

    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).exactly(2).times.and_return DATA

    visit root_path :es
    click_link "Lista de Deportes"
    click_link "Football"

    expect(page).to have_content "Eventos de Football"

    within "tr#event_id_11" do
      expect(page).to have_link "Elche v Alicante", href: sport_event_path(:es, sport_id, 11)
    end
    within "tr#event_id_12" do
      expect(page).to have_link "Horn v Breda", href: sport_event_path(:es, sport_id, 12)
    end
    within "tr#event_id_13" do
      expect(page).to have_link "Rafal v Benejuzar", href: sport_event_path(:es, sport_id, 13)
    end
  end

end
