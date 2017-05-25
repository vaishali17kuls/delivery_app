class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def index
   @orders=Order.all
  end
  
  def create
    @order = Order.new(order_params)
    @order.item= @order.item
    if @order.save
     flash[:success] = "Order has been delivered"
     #redirect_to article_path(@article)
     redirect_to order_path(@order)
     else
       render 'new'
    end
  end
  
  def show
      @order = Order.find(params[:id])
  end

  private
  def order_params
   params.require(:order).permit(:info)
  end
  
end