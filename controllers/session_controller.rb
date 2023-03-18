class SessionController < ApplicationController
    def new
      # Render halaman login
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        # Autentikasi berhasil
        session[:user_id] = user.id
        redirect_to root_url, notice: "Login berhasil"
      else
        # Autentikasi gagal
        flash.now.alert = "Email atau password salah"
        render "new"
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logout berhasil"
    end
  end
  