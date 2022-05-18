class ApplicationController < ActionController::Base
  include Pundit

  # rescue_from(Pundit::NotAuthorizedError, with: :forbidden)

  private

  # def forbidden
  #   # set flash variable
  #   # make sure it's visible to the next request using flash
  #   flash[:alert] = 'You are not authorised to perform that action'
  #   redirect_to(root_path)
  # end
end
