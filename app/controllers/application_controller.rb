class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password) }
        end
        
  private
      def user_not_authorized
          flash[:warning] = "You are not authorized to perform this action."
          redirect_to(request.referrer || root_path)
      end
end
