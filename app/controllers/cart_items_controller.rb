class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def create
    @cart.add_product(params)
    if @cart.save
      redirect_to carts_path
    else
      flash[:error] = 'Not added to cart'
      redirect_to @product
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity == 1
      @cart_item.destroy
    else
      @cart_item.quantity -=1
      @cart_item.save
    end
    product = Product.find(@cart_item.product_id)
    product.quantity +=1
    product.save 
    flash.notice = "Product '#{product.name}' Removed!"

    redirect_to carts_path
  end
end
