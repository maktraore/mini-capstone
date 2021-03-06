class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  # before_action :authenticate_user

  def current_user
     if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
     end
  end
  def authenticate_user
    redirect_to "/login" unless current_user
  end

 def authenticate_admin!
   unless current_user && current_user.admin
    flash[:warning] = "You don't have that right"
    redirect_to "/login"
   end
 end
end