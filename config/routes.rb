Rails.application.routes.draw do

  resources :posts
  resources :space_memberships
  resources :spaces
  
  
	scope "(:locale)" do

	  	ActiveAdmin.routes(self)
	  	
	  	devise_for :users, :controllers => { :invitations => 'invitations' }

			get 'profile/:id', to: 'users#show', as: 'profile'

	  	get 'home', to: 'home#index', as: 'home'

	  	root to: 'home#index'

  	end

end
