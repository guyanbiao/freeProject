class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user!
  	if session[:current_user].present?
  		 @current_user = User.find(session[:current_user])
  	end
  	redirect_to new_session_path unless @current_user.present?
  end
end
