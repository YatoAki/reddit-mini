class SubsController < ApplicationController
  before_action :require_user_login, except: [:index,:show]
  before_action :require_user_own_sub, only: [:edit,:update,:destroy]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to @sub
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def sub_params
    params.require(:sub).permit(:name,:detail)
  end

  def require_user_own_sub
    return if current_user.subs.find_by_id(params[:id])
    render json: "Forbidden", status: :forbidden
  end

end
