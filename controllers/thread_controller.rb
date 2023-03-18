class ThreadsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @threads = Thread.all
    end
  
    def show
      @thread = Thread.find(params[:id])
      @posts = @thread.posts
    end
  
    def new
      @thread = Thread.new
    end
  
    def create
      @thread = Thread.new(thread_params)
      @thread.user = current_user
      if @thread.save
        redirect_to thread_path(@thread)
      else
        render :new
      end
    end
  
    private
  
    def thread_params
      params.require(:thread).permit(:title, :content, :category_id)
    end
  end
  