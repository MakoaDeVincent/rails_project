class UsersController < ApplicationController
    before_action :if_logged_in_direct_home


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user] = @user
            redirect_to films_path#(@user)
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
