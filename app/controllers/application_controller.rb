class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from NetworkException, with: :not_found

  protected
  def not_found(exception)
    redirect_to root_path, alert: exception.cause
  end
end
