require "spec_helper"


describe "Live.new" do

  it "should instantiate an instance variable for caching" do
    live = Live.new
    expect(live.instance_variable_get("@cache")).to be_a ActiveSupport::Cache::MemoryStore
  end

end
