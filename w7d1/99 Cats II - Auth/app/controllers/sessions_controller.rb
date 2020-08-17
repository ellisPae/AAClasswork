class SessionsController < ApplicationController

    def new
        render :new
    end
    
    def create
        # render plain: "You done messed up!"
        # login_user!(params)

        user = User.find_by_user_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )


        if user
            login!(user)  #TODO make login!
            redirect_to cats_url            
        else
            flash.now[:errors] = ['invalid credentials, fool!']
            render :new
        end
    end


    def destroy
        logout!
        redirect_to new_session_url
    end

end