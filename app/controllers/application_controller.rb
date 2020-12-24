class ApplicationController < ActionController::Base

    include ApplicationHelper

    private
    
    def check_logged_in
        redirect_to '/' if !logged_in?
    end

    def if_logged_in_direct_home
        if logged_in?
            redirect_to films_path
        end
    end
end
