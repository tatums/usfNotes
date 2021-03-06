class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :all
  protect_from_forgery
  helper_method :current_user_session, :current_user
  
  protected
  
    helper_method :is_admin
    
    def is_admin
      return true if current_user.is_administrator == true
    end

    helper_method :is_user
    
    def is_user
      return true if current_user.is_administrator == false
    end
  
  
  private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    
    def require_user
      unless current_user
        store_location
        flash[:alert] = "You must be logged in to access this page"
        redirect_to login_url
        return false
      end
    end
  
  
    def require_admin
      unless is_admin
        store_location
        flash[:warning] = "Sorry you are setup as a user.  This is an administrator area."
        redirect_to login_url
        return false
      end
    end
  
  
    
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
      session[:return_to] = request.fullpath
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
  
  
  
end
