class NotFoundException < Exception
  
  def initialize
    @cause = "Could not found the requested data. Maybe the market is no longer available. Try with a different one."
  end

  def cause
    @cause
  end
end
