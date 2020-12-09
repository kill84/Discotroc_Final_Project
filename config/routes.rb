Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :deals do
    resources :comments, only: %i[new create destroy]
  end

  resources :users
  resources :discs
  resources :genres
  resources :tracks
  resources :artists
  resources :styles
  resources :deal_contents
  resources :deal_pms
  resources :user_libraries
  resources :disc_states
  resources :contacts, only: %i[new create]
  resources :articles
end
