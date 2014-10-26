require "spec_helper"


describe "fetch! method" do

  it "should return false if an exception was raised while getting the data from the API" do
    # stub HTTParty.get method
    expect(HTTParty).to receive(:get).with(Live::API_URL).and_raise Exception

    expect(Live.instance.fetch!).to be false
  end

  it "should return false if API response is not OK" do
    # mock response
    response = double("response")
    expect(response).to receive(:ok?).and_return false

    # stub HTTParty.get method
    expect(HTTParty).to receive(:get).with(Live::API_URL).and_return response

    expect(Live.instance.fetch!).to eq false
  end

  it "should return the JSON data parsed into a hash" do
    # mock response
    response = double("response")
    expect(response).to receive(:ok?).and_return true
    expect(response).to receive(:body).and_return DATA.to_json

    # stub HTTParty.get method
    expect(HTTParty).to receive(:get).with(Live::API_URL).and_return response

    data = Live.instance.fetch!
    expect(data).to be_a Hash
    expect(data.has_key?(:sports)).to be true
    expect(data[:sports]).to be_an Array
    expect(data[:sports].size).to be 3
    expect(data[:sports].first.has_key?(:events)).to be true
    expect(data[:sports].first[:events]).to be_an Array
    expect(data[:sports].first[:events].size).to be 3
    expect(data[:sports].first[:events].first.has_key?(:outcomes)).to be true
    expect(data[:sports].first[:events].first[:outcomes].size).to be 3
  end

end
