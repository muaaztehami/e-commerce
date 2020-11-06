class ProductsRepresenter
  def initialize(products)
    @products = products
  end

  def as_json
    products.map do |product|
      {
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        quantity: product.quantity,
        image: product.image.url
      }
    end
  end

  private

  attr_reader :products # allow to access products by products methods only availabe inside the class
end
