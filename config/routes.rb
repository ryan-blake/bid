Rails.application.routes.draw do
  devise_for :clients
  devise_for :laborers
  resources :clients
  resources :laborers
  resources :jobs
  resources :welcomes

  root 'jobs#index'
end
