class RatingsController < ApplicationController
    before_action :check_logged_in

    def index
        @ratings = Rating.all
    end

    def show
        @ratings = current_user.games.where(rating_id: params[:id])
        render :show
    end

end
