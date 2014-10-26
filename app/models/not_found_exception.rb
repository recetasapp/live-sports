class NotFoundException < Exception
  
  def initialize
    @cause = :not_found_exception_message
  end

  def cause
    @cause
  end
end
