Rails.application.routes.draw do

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

  root 'jobs#index'
end
