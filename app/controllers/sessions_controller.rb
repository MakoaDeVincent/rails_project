class SessionsController < ApplicationController
    #before_action :if_logged_in_direct_home

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

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid']
        end

        session[:user_id] = @user.id

        redirect_to '/films'
    end

    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end
