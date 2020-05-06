class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    authorize! :index, User
    @users = User.all
  end

  def profile
    @user = current_user.id
  end
end
