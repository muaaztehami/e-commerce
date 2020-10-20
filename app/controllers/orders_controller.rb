class OrdersController < ApplicationController
  #before_action :logged_in_user

  def index
    @orders = Order.where(user_id: current_user)
  end

  def new
    #@cart = current_cart
    if @cart.cart_items.empty?
      flash[:danger] = "Your cart is empty"
      redirect_to root_path
      return
    end
 
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  
    if @order.save
      session[:cart_id] = nil
      flash[:success] = "Thank you for your order!"
      redirect_to orders_path
    else
      #@cart = current_cart
      render 'new'
    end

  end

  private

    def order_params
      params.require(:order).permit(:delivery_address, :delivery_type, :payment_type, :user_id, :cart_id)
    end
end
