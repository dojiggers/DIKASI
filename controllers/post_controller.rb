class PostsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @thread = Thread.find(params[:thread_id])
      @post = @thread.posts.build(post_params)
      @post.user = current_user
      if @post.save
        redirect_to thread_path(@thread)
      else
        render 'threads/show'
      end
    end
  
    def edit
      @post = Post.find(params[:id])
      @thread = @post.thread
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to thread_path(@post.thread)
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @thread = @post.thread
      @post.destroy
      redirect_to thread_path(@thread)
    end
  
    private
  
    def post_params
      params.require(:post).permit(:content)
    end
  end
  