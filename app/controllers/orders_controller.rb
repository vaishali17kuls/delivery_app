class OrdersController < ApplicationController
  
  def new
   @order=Order.new
  end
  
  def index
   @orders=Order.all
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
     flash[:success] = "Order has been delivered"
     redirect_to orders_path
     else
       render 'new'
    end
  end
  
  private
  def order_params
   params.require(:order).permit()
  end
  
end