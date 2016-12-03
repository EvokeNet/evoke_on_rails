class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
  	{ locale: I18n.locale }
  end

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.role?(:admin)
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
    end
  end

  # def authenticate_admin_user!
  #   authenticate_user! 
  #   unless current_user.admin?
  #     flash[:alert] = "This area is restricted to administrators only."
  #     redirect_to root_path 
  #   end
  # end
   
  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [:email, :role])
    end

  private
  	def set_locale
  	  I18n.locale = extract_locale || I18n.default_locale
  	end

    def authenticate_inviter!
      unless current_user.role?(:admin)
        flash[:alert] = "You are not authorized to access this resource!"
        redirect_to root_path
      end
    end

end
