class NetworkException < Exception
  
  def initialize
    @cause = "Could not retreive data from network! Try again later."
  end

  def cause
    @cause
  end
end
