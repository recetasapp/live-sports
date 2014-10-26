require "spec_helper"


describe "cause method" do

  it "should return the cause of the exception" do
    exception = NotFoundException.new
    expect(exception.cause).to eq :not_found_exception_message
  end

end
