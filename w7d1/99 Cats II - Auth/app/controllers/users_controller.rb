class UsersController < ApplicationController

    # before_action :

    def new
        @user = User.new
        render :new
    end


    def create
        @user = User.new(user_params) #after_initialize
        
        if @user.save  #before_validation (~= after_initialize)
            login_user!(@user)
            redirect_to cats_url
        else
            flash.now[:errors] = ['invalid new username/shitty password, fool!']
            render :new
        end
    end






    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end



end