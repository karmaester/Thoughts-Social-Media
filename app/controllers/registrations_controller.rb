class RegistrationsController < Devise::RegistrationsController

    private_methods

    def sign_up_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :avatar_image, :cover_image)
    end

    def acount_update_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password, :avatar_image, :cover_image)
    end

end