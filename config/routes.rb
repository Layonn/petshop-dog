Rails.application.routes.draw do
  resources :breeds
  resources :dogs
  resources :clients
  root to: 'dogs#index'
end
