Lanparty::Application.routes.draw do
	scope "(:locale)", :locale => /en|nl/ do

		resources :blog_posts do
			resources :blog_comments
		end

		resources :orders do
			resources :order_items do
				post "scan", :on => :collection
				post "add", :on => :collection
			end
		end

		resources :clans

		resources :store_item_classes

		resources :pricing_defaults

		resources :user_groups

		resources :logs

		resources :sponsors

		match 'user/edit' => 'users#edit', :as => :edit_current_user

		match 'signup' => 'users#new', :as => :signup

		match 'logout' => 'sessions#destroy', :as => :logout

		match 'login' => 'sessions#new', :as => :login

		match 'info' => 'pages#info'
		match 'location' => 'pages#location'
		match 'faq' => 'pages#faq'
		match 'contact' => 'pages#contact', :as => :contact
		match 'signup_finished' => 'pages#signup_finished', :as => :signup_finished
		match 'darules' => 'pages#rules', :as => :rules
		match 'admin' => 'pages#admin', :as => :admin

		resources :teams do
			put :join, :on => :member
			put :leave, :on => :member
		end

		resources :sessions

		resources :users do
			post :markpayed, :on => :collection
		end

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
	end

	match '/:locale' => 'pages#home', :as => :home
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
	root :to => 'pages#home'

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id))(.:format)'
end
