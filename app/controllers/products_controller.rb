class ProductsController < ApplicationController
  include ProductsHelper
  #before_action :authenticate_admin_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      flash.notice = "Product '#{@product.name}' Created!"
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash.notice = "Product '#{@product.name}' Updated!"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash.notice = "Product '#{@product.name}' Deleted!"
    redirect_to products_path
  end
end
