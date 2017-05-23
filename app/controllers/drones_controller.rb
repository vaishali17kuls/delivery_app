class DronesController < ApplicationController
  before_action :set_drone, only: [:edit, :update, :show]
  before_action :require_same_drone, only: [:edit, :update]
  def new
    @drone = Drone.new
  end

 def create
   @drone = Drone.new(drone_params)
   if @drone.save
     session[:drone_id] = @drone.id
     flash[:success] = "Welcome to the delivery app #{@drone.dronename}"
     redirect_to drone_path(@drone)
     else
       render 'new'
   end
 end
 
 def edit
   
 end

 def update
   if @drone.update(drone_params)
     flash[:success] = "Your account was updated successfully"
     redirect_to items_path
     else
       render 'edit'
   end
 end
 
 def show
   @drone_items = @drone.items.paginate(page: params[:page], per_page: 5)
 end
 
 def index
   @drones =Drone.paginate(page: params[:page], per_page: 5)
 end

private
def drone_params
  params.require(:drone).permit(:dronename, :email, :password)
end

def set_drone
  @drone = Drone.find(params[:id])
end

def require_same_drone
  if current_drone != @drone
    flash[:danger] = "You can only edit your own account"
    redirect_to root_path
  end
end

end