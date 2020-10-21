class ApplicationController < ActionController::Base
  before_action :set_cart
  

  private
  def set_cart
    @cart = Cart.find(session[:cart_id])
    # @cart = Cart.where(user: current_user, cart_status: true)
    # puts ".....cart......"
    # if @cart.blank?
    #   @cart = Cart.create(user: current_user)
    # puts ".........new cart....."
    # end
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create()
    session[:cart_id] = @cart.id 
  end
end
