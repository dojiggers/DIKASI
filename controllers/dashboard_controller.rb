class DashboardController < ApplicationController
    def index
      firebase_db = Firebase::Database.new(FIREBASE_PROJECT_ID)
      @users = firebase_db.get("users").body.values
      @posts = firebase_db.get("posts").body.values
      @comments = firebase_db.get("comments").body.values
    end
  end
  