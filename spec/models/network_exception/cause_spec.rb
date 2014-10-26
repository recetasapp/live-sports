require "spec_helper"


describe "cause method" do

  it "should return the cause of the exception" do
    exception = NetworkException.new
    expect(exception.cause).to eq "Could not retreive data from network! Try again later."
  end

end
