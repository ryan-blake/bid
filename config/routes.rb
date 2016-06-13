Rails.application.routes.draw do

  get 'messegas/new'

  get 'messegas/create'

  resources :charges, only: [:new, :create]

  devise_for :clients
  devise_for :laborers

  resources :clients

  resources :laborers do
    resources :reviews
  end

resources :jobs do
      resources :submissions
      collection do
        get 'search'
      end
  end

  resources :welcomes
  # resources :submits

  #mailers
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

  resources :searches

  root 'jobs#index'


end
