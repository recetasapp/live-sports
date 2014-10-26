require "spec_helper"


describe "data method" do

  it "should raise a network exception if fetch! returned false" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return false

    expect(lambda{Live.instance.data}).to raise_error NetworkException
  end

  it "should return the data obtained from the method fetch!" do
    # stub Live.fetch! method
    expect(Live.instance).to receive(:fetch!).and_return DATA

    expect(Live.instance.data).to be DATA
  end

end
