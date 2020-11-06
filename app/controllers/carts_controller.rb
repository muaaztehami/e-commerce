class CartsController < ApplicationController
  before_action :set_cart, only: [:index]
  before_action :authenticate_user!
  def index; end
end
