Rails.application.routes.draw do
  root 'main#index'

  resources :sessions, only: %i[new create]
  resource :sessions, only: :destroy, as: :destroy_session
  resources :users do
    resource :lock, only: :create, controller: 'users/locks'
  end
  resources :admins do
    resource :lock, only: :create, controller: 'admins/locks'
  end
  scope module: :statictics, path: :statictics do
    resources :top_products, only: :index do
      collection do
        resources :data, only: :index, controller: 'top_products/data'
      end
    end
  end
  resources :system_configs
  resources :shop_details
  resources :roles, expect: :show
  resources :products
  resources :orders
  resources :categories
  resources :main, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
