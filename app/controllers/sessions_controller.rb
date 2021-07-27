class SessionsController < ApplicationController

    def new
    end

    def create
        # byebug
        user = User.find_by(name: params[:user][:name])
        if user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to '/signin'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

end