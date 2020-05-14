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

    def edit
        @users = User.find(params[:id])
    end

    
    def update
        @users = User.find(params[:id])
        if @users.update(user_params)
            flash[:success] = "Votre profil a été mis-à-jour."

          redirect_to user_path(@users.id)
        else 
            render 'edit'
            end 
        
    end

    private

    def authenticate_user
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :description)
      end

end
