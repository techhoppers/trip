class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    (session[:user_return_to].nil?) ? "/" : session[:user_return_to].to_s
  end

  
  private
  
  def is_admin?
    unless user_signed_in? && current_user.is_admin?
      flash[:notice] = "You are not authorized to view this page!"
    end
  end
  
  def logged_in?
    unless user_signed_in?
      flash[:notice] = "You must login to use this feature!"
      redirect_to new_user_session_path
    end
  end
end
