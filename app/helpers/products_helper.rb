module ProductsHelper
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :image)
  end
end
