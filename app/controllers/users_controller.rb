class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # byebug
        user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def show
        if current_user
          @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
end