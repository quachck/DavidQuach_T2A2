class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  rescue_from(Pundit::NotAuthorizedError, with: :forbidden)

  private

  def forbidden
    # set flash variable
    # make sure it's visible to the next request using flash
    flash[:alert] = 'You are not authorised to perform that action'
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:number])
  end
end
