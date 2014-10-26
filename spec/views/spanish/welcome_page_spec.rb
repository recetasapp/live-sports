require "spec_helper"


describe "Welcome page" do

  it "should have a link to go to the list of sports" do
    visit root_path :es
    expect(page).to have_content "Bienvenido"
    expect(page).to have_content "Elige una opcion:"
    expect(page).to have_link "Lista de Deportes", href: sports_path(:es)
  end

end
