class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback: :none
  respond_to :json
  protect_from_forgery with: :null_session

  before_action :set_cart

  private

  # def after_successful_token_authentication
  #   # Make the authentication token to be disposable - for example
  #   renew_authentication_token!
  # end

  def set_cart
    @cart = Cart.find(session[:cart_id])
    # @cart = Cart.where(user: current_user, cart_status: true)
    # puts ".....cart......"
    # if @cart.blank?
    #   @cart = Cart.create(user: current_user)
    # puts ".........new cart....."
    # end
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
