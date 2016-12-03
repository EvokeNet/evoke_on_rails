Rails.application.routes.draw do

	scope "(:locale)" do
	  	# devise_for :admin_users, ActiveAdmin::Devise.config

	  	ActiveAdmin.routes(self)
	  
	  	# devise_for :users
	  	
	  	devise_for :users, :controllers => { :invitations => 'invitations' }

	  	# devise_scope :user do
		  #   get "login", to: "devise/sessions#new"
		  #   authenticated :user do
		  #     root :to => 'admin/dashboard#index', as: :authenticated_root
		  #   end
		  #   unauthenticated :user do
		  #     root :to => 'users/sessions#new', as: :unauthenticated_root
		  #   end
		  # end

		  # devise_for :users, 
    #       :controllers => { 
    #       :sessions => "users_sessions", 
    #       :registrations => "user_registrations", 
    #       :passwords => "user_passwords",
    #       # Proper invitations should be sent through the active_admin interface.
    #       :invitations => 'users_invitations' # user_invitations_controller.rb
    #       }

	  	# scope "(:locale)", locale: /en|es/ do

		 #  scope "/admin" do
			# resources :users
		 #  end

		get 'profile/:id', to: 'users#show', as: 'profile'

	  	get 'home', to: 'home#index', as: 'home'

	  	root to: 'home#index'

  	end

end
