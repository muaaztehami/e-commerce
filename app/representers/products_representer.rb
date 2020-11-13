class ProductsRepresenter
  def initialize(prod)
    @products = prod
  end

  def as_json
    # puts('CHECK',products.size)
    # if products.size == 100
    #   puts(products)
    #   {
    #     id: products.id,
    #     name: products.name,
    #     description: products.description,
    #     price: products.price,
    #     quantity: products.quantity,
    #     image: products.image.url
    #   }
    # else
      products.map do |product|
        puts(products)
        {
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          quantity: product.quantity,
          image: product.image.url
        }
      end
    # end
    
  end

  private

  attr_reader :products # allow to access products by products methods only availabe inside the class
end
