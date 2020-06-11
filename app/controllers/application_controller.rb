class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_cart

#  protect_from_forgery
#  protected
  def authenticate_user
  	if session[:user_id]
      	    @current_user = User.find session[:user_id]
  	    return false
  	else
      # set current_user by the current user object
      		redirect_to(:controller => 'sessions', :action => 'login')
  		return true
  	end
  end

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
            redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end

  private
  def set_cart
    if session[:cart]
      @cart = session[:cart]
    else
       session[:cart] = []
      @cart = session[:cart]
    end
  end
  
end
