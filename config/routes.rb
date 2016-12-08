Rails.application.routes.draw do

 # resources :posts, :except => [:new]
 #  resources :space_memberships
 #  resources :spaces
  
	scope "(:locale)" do

	  	ActiveAdmin.routes(self)
	  	
	  	devise_for :users, :controllers => { :invitations => 'invitations' }

		resources :posts, :except => [:new]
  		resources :spaces
  		resources :space_memberships do
			member do
		    	get 'join'
		    	get 'leave'
		  	end
		end

		get 'profile/:id', to: 'users#show', as: 'profile'

	  	get 'home', to: 'home#index', as: 'home'

	  	root to: 'home#index'

  	end

end
