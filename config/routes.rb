Lanparty::Application.routes.draw do

  resources :pricing_defaults


  resources :user_groups


  resources :logs

	match 'user/edit' => 'users#edit', :as => :edit_current_user

	match 'signup' => 'users#new', :as => :signup

	match 'logout' => 'sessions#destroy', :as => :logout

	match 'login' => 'sessions#new', :as => :login

	resources :teams do
		put :join, :on => :member
		put :leave, :on => :member
	end

	resources :sessions

	resources :users

	resources :match_lose_links

	resources :match_win_links

	resources :match_scores

	resources :rounds

	resources :matches

	resources :prices

	resources :games

	resources :compos

	resources :barcodes

	resources :store_items

	match '/', :to => 'compos#index'

	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#	 match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	#	 match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
	# This route can be invoked with purchase_url(:id => product.id)

	# Sample resource route (maps HTTP verbs to controller actions automatically):
	#	 resources :products

	# Sample resource route with options:
	#	 resources :products do
	#		 member do
	#			 get 'short'
	#			 post 'toggle'
	#		 end
	#
	#		 collection do
	#			 get 'sold'
	#		 end
	#	 end

	# Sample resource route with sub-resources:
	#	 resources :products do
	#		 resources :comments, :sales
	#		 resource :seller
	#	 end

	# Sample resource route with more complex sub-resources
	#	 resources :products do
	#		 resources :comments
	#		 resources :sales do
	#			 get 'recent', :on => :collection
	#		 end
	#	 end

	# Sample resource route within a namespace:
	#	 namespace :admin do
	#		 # Directs /admin/products/* to Admin::ProductsController
	#		 # (app/controllers/admin/products_controller.rb)
	#		 resources :products
	#	 end

	# You can have the root of your site routed with "root"
	# just remember to delete public/index.html.
	root :to => 'compos#index'

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id))(.:format)'
end
