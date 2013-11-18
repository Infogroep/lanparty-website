Lanparty::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

	scope '(:locale)', locale: /en|nl/ do

		resources :blog_posts do
			resources :blog_comments
		end

		resources :orders do
			resources :order_items do
				post 'scan', on: :collection
				post 'add', on: :collection
			end

			patch 'place', on: :member
			patch 'pay', on: :member
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

		scope 'dynamic_scripts', as: :dynamic_scripts do
			get 'datatables', to: 'dynamic_scripts#datatables', as: :datatables
		end

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

		root to: 'pages#home', as: :home
	end

	root to: 'pages#home'
end
