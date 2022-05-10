class PostsController < ApplicationController

    before_action :get_sub
    before_action :require_user_login, except: [:show]
    before_action :require_user_own_sub, only: [:destroy]

    def show
      @post = Post.find_by_id(params[:id])
    end

    def create
      @post = @sub.posts.new(post_params)
      @post.author = current_user
      @post.save
      redirect_to sub_path(@sub)
    end

    def destroy
      @post = @sub.posts.find(params[:id])
      @post.destroy
      redirect_to sub_path(@sub), status: :see_other
    end


    private

    def get_sub
      @sub = Sub.find(params[:sub_id])
    end

    def post_params
      params.require(:post).permit(:title,:content)
    end

    def require_user_own_post
      return if current_user.posts.find_by_id(params[:id])
      render json: "Forbidden", status: :forbidden
    end

end
