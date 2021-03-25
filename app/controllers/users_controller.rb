class UsersController < ApplicationController

    def home
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        #binding.pry
        if params[:user][:password] == params[:user][:password_confirmation]
            @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            redirect_to new_user_path
        end
    end

    def login
        @user = User.new
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
