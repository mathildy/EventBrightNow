class UsersController < ApplicationController

    def index
        @users = User.all
      end
    
    def show
        @users = User.find(params[:id])
        @events_user = User.find(params[:id]).events

    end
end
