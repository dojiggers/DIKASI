class ModeratorsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: [:index, :create, :destroy]
  
    def index
      @moderators = @category.moderators
    end
  
    def create
      @user = User.find_by(email: params[:email])
      if @user
        @moderator = Moderator.new(category_id: @category.id, user_id: @user.id)
        if @moderator.save
          flash[:notice] = "Moderator berhasil ditambahkan"
        else
          flash[:alert] = "Gagal menambahkan moderator"
        end
      else
        flash[:alert] = "Email tidak ditemukan"
      end
      redirect_to moderators_category_path(@category)
    end
  
    def destroy
      @moderator = Moderator.find(params[:id])
      if @moderator.destroy
        flash[:notice] = "Moderator berhasil dihapus"
      else
        flash[:alert] = "Gagal menghapus moderator"
      end
      redirect_to moderators_category_path(@category)
    end
  
    private
  
    def set_category
      @category = Category.find(params[:category_id])
    end
  end
  