Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :clients
  devise_for :laborers

  resources :clients
  resources :laborers

  resources :jobs do
    resources :submissions
  end
  resources :welcomes
  # resources :submits

  #mailers
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  
  root 'jobs#index'
end
