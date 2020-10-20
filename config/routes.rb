Rails.application.routes.draw do
  devise_for :users, controllers: {
    #sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  resources :cart_items, only: [:create, :update, :destroy]
  get 'carts', to: 'carts#index'

  root 'welcome#index'
end
