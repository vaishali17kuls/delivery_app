class SessionsController < ApplicationController

def new

end

 def create
   drone = Drone.find_by(email: params[:session][:email].downcase)
   if drone && drone.authenticate(params[:session][:password])
    session[:drone_id] = drone.id
    flash[:success] = "You have successfully logged in"
    redirect_to drone_path(drone)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
  end
 end

 def destroy
   session[:drone_id] = nil
   flash[:success] = "You have logged out"
   redirect_to root_path
 end

end