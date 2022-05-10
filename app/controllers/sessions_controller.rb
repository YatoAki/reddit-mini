class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login_user!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Username or password is incorrect"]
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    logout_user!
    redirect_to new_session_url, status: :see_other
  end
end
