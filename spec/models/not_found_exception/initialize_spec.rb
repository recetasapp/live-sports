require "spec_helper"


describe "NotFoundException.new" do

  it "should instantiate an instance variable with the cause" do
    exception = NotFoundException.new
    expect(exception.instance_variable_get("@cause")).to eq "Could not found the requested data. Maybe the market is no longer available. Try with a different one."
  end

end
