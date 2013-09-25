Lanparty::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

	scope "(:locale)", locale: /en|nl/ do

		resources :blog_posts do
			resources :blog_comments
		end

		resources :orders do
			resources :order_items do
				post "scan", on: :collection
				post "add", on: :collection
			end

			patch "place", on: :member
			patch "pay", on: :member
		end

		resources :clans

		resources :store_item_classes

		resources :pricing_defaults

		resources :store_item_pricing_overrides

		resources :store_item_class_pricing_overrides

		resources :user_groups

		resources :logs

		resources :sponsors

		get 'user/edit', to: 'users#edit', as: :edit_current_user

		get 'signup', to: 'users#new', as: :signup

		get 'logout', to: 'sessions#destroy', as: :logout

		get 'login', to: 'sessions#new', as: :login

		get 'info', to: 'pages#info'
		get 'location', to: 'pages#location'
		get 'faq', to: 'pages#faq'
		get 'contact', to: 'pages#contact', as: :contact
		get 'signup_finished', to: 'pages#signup_finished', as: :signup_finished
		get 'darules', to: 'pages#rules', as: :rules
		get 'admin', to: 'pages#admin', as: :admin

		namespace 'util' do
			get 'soundtest', to: 'soundtest#soundtest', as: :soundtest
			get 'order_check', to: 'order_check#order_check', as: :order_check
		end

		resources :teams do
			patch :join, on: :member
			patch :leave, on: :member
		end

		resources :sessions

		resources :users do
			post :markpayed, on: :collection
			get :soundtest, on: :collection
		end

		resources :match_lose_links

		resources :match_win_links

		resources :match_scores

		resources :rounds

		resources :matches

		resources :prices

		resources :games

		resources :compos do
			patch :save_bracket, on: :member
		end

		resources :barcodes

		resources :store_items
	end

	get '/:locale', to: 'pages#home', as: :home
	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#	 get 'products/:id', to: 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	#	 get 'products/:id/purchase', to: 'catalog#purchase', as: :purchase
	# This route can be invoked with purchase_url(id: product.id)

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
	#			 get 'recent', on: :collection
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
	root to: 'pages#home'

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id))(.:format)'
end
