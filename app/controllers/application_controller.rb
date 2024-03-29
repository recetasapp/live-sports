class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from NetworkException, with: :not_found
  rescue_from NotFoundException, with: :not_found

  before_action :set_locale

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  protected
  def not_found(exception)
    redirect_to root_path, alert: t(exception.cause)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
