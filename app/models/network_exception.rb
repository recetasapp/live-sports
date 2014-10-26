class NetworkException < Exception
  
  def initialize
    @cause = :network_exception_message
  end

  def cause
    @cause
  end
end
