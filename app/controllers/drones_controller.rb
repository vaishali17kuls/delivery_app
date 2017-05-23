class DronesController < ApplicationController
  def new
    @drone = Drone.new
  end

 def create
   @drone = Drone.new(drone_params)
   if @drone.save
     flash[:success] = "Welcome to the delivery app #{@drone.dronename}"
     redirect_to items_path
     else
       render 'new'
  end
  end

private
def drone_params
  params.require(:drone).permit(:dronename, :email, :password)
end

end