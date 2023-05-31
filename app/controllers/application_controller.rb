class ApplicationController < ActionController::Base
#     redirect_to root_url, alert: exception.message

    before_action :authenticate_user!

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

 
    add_flash_types :info, :error, :warning


    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({role_ids: []},:fullname, :contact, :image, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :fullname, :contact, :image, :email, :password, :current_password)}
         end

end
