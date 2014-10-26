# -*- coding: utf-8 -*-
require "spec_helper"


describe "Layout" do

  it "should have a link to toggle language" do
    visit root_path :en
    expect(page).to have_content "Welcome"
    expect(page).to have_content "Select an option:"
    expect(page).to have_link "List of Sports", href: sports_path(:en)

    click_link "Cambia a Español"
    expect(page).to have_content "Bienvenido"
    expect(page).to have_content "Elige una opcion:"
    expect(page).to have_link "Lista de Deportes", href: sports_path(:es)
  end

end
