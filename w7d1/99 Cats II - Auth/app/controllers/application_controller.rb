class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?


    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end


    def login_user!(user)
        user = User.find_by_user_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        
        if user
            login!(user) 
            redirect_to cats_url            
        else
            flash.now[:errors] = ['invalid credentials, fool!']
            render :new
        end

        # session[:session_token] = user.reset_session_token
    end
    


    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
    

    def logged_in?
        !!current_user 
        # same as !current_user.nil?
    end


    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
    
end
