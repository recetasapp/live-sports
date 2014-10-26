require "spec_helper"


describe "sports method" do

  it "should return the list of sports sorted by attribute pos" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    sports = Live.instance.sports
    expect(sports[1][:pos]).to be >= sports[0][:pos]
    expect(sports[2][:pos]).to be >= sports[1][:pos]
  end

end
