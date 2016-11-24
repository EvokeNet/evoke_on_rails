Rails.application.routes.draw do

  devise_for :users
  get 'home', to: 'home#index', as: 'home'

  root to: 'home#index'

end
