Rails.application.routes.draw do
  get 'welcome/index'
  # devise_for :users, controllers: {
  #   #sessions: 'users/sessions',
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }
  
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]
      
      devise_for :users, controllers: {
        #sessions: 'users/sessions',
        registrations: 'api/v1/custom_devise/registrations',
        sessions: 'api/v1/custom_devise/sessions',
        omniauth_callbacks: 'api/v1/users/omniauth_callbacks'
      }
    end
  end


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cart_items, only: [:create, :update, :destroy]
  get 'carts', to: 'carts#index'
  resources :orders
  root 'welcome#index'
end
