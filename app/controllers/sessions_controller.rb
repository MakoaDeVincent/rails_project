class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to films_path
        else 
            flash.now[:alert] = "Username or Password incorrect!"
            render :new
        end
    end
end
