class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  private_methods

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :avatar_image,
                                 :cover_image)
  end

  def acount_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password,
                                 :avatar_image, :cover_image)
  end
end
