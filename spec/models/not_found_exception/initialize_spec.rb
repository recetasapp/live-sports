require "spec_helper"


describe "NotFoundException.new" do

  it "should instantiate an instance variable with the cause" do
    exception = NotFoundException.new
    expect(exception.instance_variable_get("@cause")).to eq :not_found_exception_message
  end

end
