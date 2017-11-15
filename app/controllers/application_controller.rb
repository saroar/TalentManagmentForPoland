class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def authenticate_active_admin_user!
  #   authenticate_user!
  #   unless current_user.has_role? :admin
  #     flash[:notice] = 'Sorry you are not Authorized to access this resource!'
  #     redirect_to root_path
  #   end
  # end
  #
  def after_sign_in_path_for(resource)
    if current_user.has_role?(:admin, :talentcouch, :consultant)
      admin_dashboard_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname] )
  end
end
