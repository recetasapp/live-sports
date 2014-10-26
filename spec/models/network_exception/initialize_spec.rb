require "spec_helper"


describe "NetworkException.new" do

  it "should instantiate an instance variable with the cause" do
    exception = NetworkException.new
    expect(exception.instance_variable_get("@cause")).to eq "Could not retreive data from network! Try again later."
  end

end
