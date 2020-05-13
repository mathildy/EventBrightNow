class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end
    
    def show
        @events_user = User.find(params[:id]).events
        @users = User.find(params[:id])
            if current_user.id != @users.id
                flash[:error] = "You are not allowed."
              redirect_to root_path
            end
    end

    private

    def authenticate_user
    end
end
