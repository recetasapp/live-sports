require "spec_helper"


describe "cause method" do

  it "should return the cause of the exception" do
    exception = NotFoundException.new
    expect(exception.cause).to eq "Could not found the requested data. Maybe the market is no longer available. Try with a different one."
  end

end
