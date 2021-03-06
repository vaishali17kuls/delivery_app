class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_drone, except: [:index, :show]
  before_action :require_same_drone, only: [:edit, :update, :destroy]
  
   def new
    @item = Item.new
   end
  
  def index
   @items = Item.paginate(page: params[:page], per_page: 5)
  end

  def show
   
  end

  def edit
    
  end
  
  def create
    @item = Item.new(item_params)
    @item.drone = Drone.first
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description)
    end
    
    def require_same_drone
      if current_drone != @item.drone
        flash[:danger] = "You can only edit or delete your own items"
        redirect_to root_path
      end
    end
end
