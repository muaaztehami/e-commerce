class OrdersController < ApplicationController
  # before_action :logged_in_user
  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user).includes([:cart])
  end

  def show
    @order_cart = Cart.find(params[:id])
  end

  def new
    # @cart = current_cart
    if @cart.cart_items.empty?
      flash[:danger] = 'Your cart is empty'
      redirect_to root_path
      return
    end

    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    calculate_total
    if @order.save
      session[:cart_id] = nil
      # @cart.cart_status = true
      flash[:success] = 'Thank you for your order!'
      redirect_to orders_path
    else
      # @cart = current_cart
      render 'new'
    end
  end

  private

  def calculate_total
    @order.total_price = @order.cart.cart_items.sum { |item| item.product.price * item.quantity }
  end

  def order_params
    params.require(:order).permit(:delivery_address, :delivery_type, :payment_type, :user_id, :cart_id)
  end
end
