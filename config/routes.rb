Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'cart', to: 'carts#show'
  resources :products

  root 'products#index'
end
