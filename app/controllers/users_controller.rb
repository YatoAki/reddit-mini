class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to subs_url
    else
      render :new,status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username,:password,:session_token)
  end
end
