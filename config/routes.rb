Rails.application.routes.draw do
  resources :products

  post 'products/:id/charge', to: 'products#charge'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
end
