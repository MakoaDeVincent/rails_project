class FilmsController < ApplicationController
    before_action :check_logged_in

    def new
        if params[:rating_id] && rating = Rating.find_by_id(params[:rating_id])
            @film = rating.films.build
        else
            @film = Film.new
        end
    end

    def create
        @film = current_user.films.build(film_params)
        if @film.save
            redirect_to film_path(@film)
        else
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
        set_film
    end

    def update
        set_film
        if @film.update(film_params)
            redirect_to film_path(@film)
        else 
            render :edit
        end
    end

    def destroy
        set_film
        @film.destroy
        redirect_to films_path
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
