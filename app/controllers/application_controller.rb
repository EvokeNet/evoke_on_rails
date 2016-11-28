class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
 
  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
  	{ locale: I18n.locale }
  end

  private
	def set_locale
	  I18n.locale = extract_locale || I18n.default_locale
	end

end
