Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
	resources :universes do 
		resources :heroes, only: [:new, :create]
	end
	resources :heroes, except: [:new, :create, :index] do
		resources :gifts, only: [:new, :create]
	end	
	resources :gifts, except: [:new, :create, :index] do
		resources :skills, only: [:new, :create]
	end	
	resources :skills, except: [:new, :create, :index]


	root 'universes#index'
end
