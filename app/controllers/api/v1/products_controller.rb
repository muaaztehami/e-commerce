class Api::V1::ProductsController < Api::V1::ApplicationController
  # protect_from_forgery with: :null_session
  # before_action :authenticate_api_v1_user!
  # before_action :verify_authenticity_token
  # before_action :authenticate_entity_from_token!
  before_action :verify_user_token

  def index
    # @products = Product.page params[:page]
    search = params[:keyword].present? ? params[:keyword] : nil
    if search
      products = Product.search(search)
    else
      products = Product.all
    end
    render json: ProductsRepresenter.new(products).as_json # serializer
  end

  def show
    product = Product.find(params[:id])
    render json: ProductRepresenter.new(product).as_json
  end

  def create
    product = Product.new(product_params)

    if product.save
      render json: ProductRepresenter.new(product).as_json, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: ProductRepresenter.new(product).as_json, status: :ok
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Product.find(params[:id]).destroy!
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :image)
  end

  def verify_user_token
    if request.headers['X-User-Token'].present?
      @current_user = User.find_by(authentication_token: request.headers['X-User-Token'])
      if @current_user.blank?
        render json: { errors: 'Invalid User Token' }, status: :bad_request
        nil
      end
    else
      render json: { errors: 'User Token required' }, status: :bad_request
    end
  end
end
