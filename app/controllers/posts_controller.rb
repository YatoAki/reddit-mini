class PostsController < ApplicationController

    before_action :get_sub

    def show
      @post = Post.find_by_id(params[:id])
    end

    def create
      @post = @sub.posts.new(post_params)
      @post.author = current_user
      if @post.save
        redirect_to sub_posts_path(@post)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def new
      @post = Post.new
    end

    private

    def get_sub
      @sub = Sub.find(params[:sub_id])
    end

end
