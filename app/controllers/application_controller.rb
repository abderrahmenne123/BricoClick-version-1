class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up){
            |u| u.permit(:firstname, :lastname, :avatar, :mobile, :email , :password, :password_confirmation,role:[])
        }
    end
    protect_from_forgery with: :null_session

    def after_sign_in_path_for(user)
       # user_url(user)
       # 'home/private'
       home_private_url()
    end
end
