class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    #we need to put in the helper method every mothod that we'll use for the controller
    helper_method :logged_in?, :login, :logout!, :current_user, :require_logged_in

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end

    def require_logged_in
        redirect_to users_url unless logged_in?
    end

    def logged_in?
        !!current_user
    end
    
    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
        
    end

end
