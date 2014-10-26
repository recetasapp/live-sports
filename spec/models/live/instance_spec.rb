require "spec_helper"


describe "Live.instance" do

  it "should return always the same intance" do
    instance1 = Live.instance
    instance2 = Live.instance
    expect(instance1).to be instance2
  end

end
