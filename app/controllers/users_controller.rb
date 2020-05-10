class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    authorize! :index, User
    # @users = User.all
    @users = User.where.not(:id => current_user.id)
  end

  def profile
    @user = current_user.id
  end

  private

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :invitation_token)
  end
end
