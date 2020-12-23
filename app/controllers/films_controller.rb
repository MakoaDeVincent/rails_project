class FilmsController < ApplicationController

    def index
        @film = Film.all
    end

    def new
    end

    def create
    end

    
end
