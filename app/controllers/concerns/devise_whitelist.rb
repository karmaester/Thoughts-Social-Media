module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar_image cover_image name username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar_image cover_image name username])
  end
end
