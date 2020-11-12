require 'rails_helper'

describe 'Sessions API', type: :request do
  let(:user2){ FactoryBot.create(:user, email: 'user2@gmail.com', password: '123456', password_confirmation: '123456') }

  it 'returns email and authentication token' do
    post '/api/v1/users/sign_in', params: { 
      "email": user2.email, "password": user2.password
    }
    expect(response).to have_http_status(:ok)
  end

  it 'throws error when wrong credentials are used' do
    post '/api/v1/users/sign_in', params: { 
      "email": user2.email, "password": '123'
    }
    expect(response).to have_http_status(:unauthorized)
  end
end