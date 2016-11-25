Rails.application.routes.draw do

  resources :users
  devise_for :users

  get 'home', to: 'home#index', as: 'home'

  root to: 'home#index'

end
