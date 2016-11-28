Rails.application.routes.draw do

  devise_for :users

  scope "(:locale)", locale: /en|es/ do

	  scope "/admin" do
		resources :users
	  end

	  get 'home', to: 'home#index', as: 'home'

	  root to: 'home#index'
	end

end
