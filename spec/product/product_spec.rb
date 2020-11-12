require 'rails_helper'

describe 'Product API', type: :request do
  let(:user1){ FactoryBot.create(:user, email: 'user1@mail.com', password: '123456', password_confirmation: '123456') }
  let(:product1){ FactoryBot.create(:product, name: 'product1', description: 'product1', price: '2', quantity: '2') }
  
  it 'returns all products' do
    FactoryBot.create(:product, name: 'product2', description: 'product1', price: '2', quantity: '2') 
    FactoryBot.create(:product, name: 'product3', description: 'product2', price: '2', quantity: '2') 
    get '/api/v1/products', 
    headers: {
      'X-User-Email' => user1.email,
      'X-User-Token' => user1.authentication_token,
    }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'returns product with ID' do
    get "/api/v1/products/#{product1.id}", 
    headers: {
      'X-User-Email' => user1.email,
      'X-User-Token' => user1.authentication_token,
    }
    expect(response).to have_http_status(:success)
    product1.reload
    expect(product1.name).to eq(product1.name)
  end
end
#{book.id}