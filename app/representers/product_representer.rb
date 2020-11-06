class ProductRepresenter
  def initialize(product)
    @product = product
  end

  def as_json
    {
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      quantity: product.quantity,
      image: product.image.url
    }
  end

  private

  attr_reader :product # allow to access products by products methods only availabe inside the class
end
