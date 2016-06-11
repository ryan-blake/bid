Rails.application.routes.draw do
  root to: 'photos#index'

     patch "/album" => "photos#update"
     post "/album/photos" => "photos#create"

  mount ImageUploader::UploadEndpoint, at: "/attachments/images"


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

  # root 'jobs#index'


end
