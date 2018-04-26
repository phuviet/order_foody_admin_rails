Rails.application.routes.draw do
  root 'main#index'

  resources :sessions, only: %i[new create]
  resource :sessions, only: :destroy, as: :destroy_session

  resources :votes
  resources :versions
  resources :users
  resources :system_configs
  resources :shop_details
  resources :roles
  resources :products_images
  resources :products
  resources :product_watcheds
  resources :orders
  resources :order_items
  resources :comments
  resources :categories
  resources :api_keys
  resources :main, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
