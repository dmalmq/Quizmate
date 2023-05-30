class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :password, :photo, :name)
  end
end
