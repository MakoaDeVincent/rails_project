class FilmsController < ApplicationController
    before_action :check_logged_in

    def new
        if params[:rating_id] && rating = Rating.find_by_id(params[:rating_id])
            @film = rating.films.build
        else
            @film = Film.new
            @film.build_rating
        end
    end

    def create
        @film = current_user.films.build(film_params)
        if @film.save
            redirect_to film_path(@film)
        else
            @film.build_rating unless @film.rating
            render :new
        end
    end

    def index #test
        @ratings = Rating.all
        if params[:rating_id] && rating = Rating.find_by_id(params[:rating_id])
            @films = rating.films
        elsif
            @films = current_user.films.all
            render :index
        end
    end

    def show
        set_film
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def film_params
        params.require(:film).permit(:name, :iso, :rating_id, ratting_attributes: [:score])
    end

    def set_film
        @film = Film.find_by(id: params[:id])
        if !@film
            redirect_to films_path
        end
    end
    
end
