class SplashController < ApplicationController
    def index
        if user_signed_in?
            redirect_to  budget_groups_path(current_user.id)
        else 
            render :index
        end        
    end
end
