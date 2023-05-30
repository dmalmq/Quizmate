class UsersController < ApplicationController
  def index
    @user = current_user
    authorize @challenge
  end
end
