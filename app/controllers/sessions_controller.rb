class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(name: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to films_path
        else 
            flash[:error] = "Username or Password was incorrect!"
            redirect_to '/login'
        end
    end
end