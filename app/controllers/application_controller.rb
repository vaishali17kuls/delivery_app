class ApplicationController < ActionController::Base

# Prevent CSRF attacks by raising an exception.

# For APIs, you may want to use :null_session instead.

protect_from_forgery with: :exception

helper_method :current_drone, :logged_in?

def current_drone
  @current_drone ||= Drone.find(session[:drone_id]) if session[:drone_id]
end

def logged_in?
  !!current_drone
end

def require_drone
  if !logged_in?
    flash[:danger] = "You must be logged in to perform that action"
    redirect_to root_path
 end
end

end
