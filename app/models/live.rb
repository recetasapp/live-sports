class Live

  # constants
  #--------------------------------------------------------------
  API_URL = "http://www.betvictor.com/live/en/live/list.json"

  # class methods
  #--------------------------------------------------------------
  def initialize
    @cache = ActiveSupport::Cache::MemoryStore.new expires_in: 10.seconds
  end

  def self.instance 
    @@instance ||= Live.new
  end

  # instance methods
  #--------------------------------------------------------------
  def fetch!
    @cache.fetch "data" do
      begin
        response = HTTParty.get API_URL
        return false unless response.ok?
        JSON.parse response.body, symbolize_names: true
      rescue
        return false
      end 
    end
  end

  def data
    if data = self.fetch!
      data
    else
      raise NetworkException.new
    end
  end

  def sports
    data = self.data
    data[:sports].sort_by {|sport| sport[:pos]}
  end

end
