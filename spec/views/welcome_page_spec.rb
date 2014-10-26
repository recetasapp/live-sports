require "spec_helper"


describe "Welcome page" do

  it "should have a link to go to the list of sports" do
    visit root_path :en
    expect(page).to have_content "Welcome"
    expect(page).to have_content "Select an option:"
    expect(page).to have_link "List of Sports", href: sports_path(:en)
  end

end
