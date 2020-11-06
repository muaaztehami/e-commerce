Rails.application.routes.draw do
  get 'welcome/index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: %i[index show create update destroy]

      devise_for :users, controllers: {
        registrations: 'api/v1/custom_devise/registrations',
        sessions: 'api/v1/custom_devise/sessions',
        omniauth_callbacks: 'api/v1/users/omniauth_callbacks'
      }
    end
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cart_items, only: %i[create update destroy]
  get 'carts', to: 'carts#index'
  resources :orders
  root 'welcome#index'
end
