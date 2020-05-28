class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    authorize! :index, User

    @users = User.where.not(:id => current_user.id)
  end

  def profile
    @user = current_user.id
  end
end
