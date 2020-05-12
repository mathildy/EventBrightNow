class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
      end
    
    def show
        @users = User.find(params[:id])
        @events_user = User.find(params[:id]).events
    end

    private

    def authenticate_user
    end
end
