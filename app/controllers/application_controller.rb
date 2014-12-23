class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user!
  	 @current_user = User.find(session[:current_user])
  	 redriect_to new_session_path unless @current_user.present?
  end
end
