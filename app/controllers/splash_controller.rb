class SplashController < ApplicationController
    def index
        if user_signed_in?
            redirect_to  groups_path(current_user)
        else 
            render :index
        end        
    end
end
