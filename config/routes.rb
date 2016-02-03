Rails.application.routes.draw do
  devise_for :clients
  devise_for :laborers
  resources :clients
  resources :laborers
  resources :jobs
  resources :welcomes
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
