Rails.application.routes.draw do

	root 'high_voltage/pages#show', id: 'welcome'

	devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
	#devise_for :users, controllers: { registrations: 'registrations' }

	resources :users

	#get 'user_root_path' => 'clients#index', as: :user_root
	#get 'admin_root_path' => 'high_voltage/pages#show', as: :admin_root

	resources :clients # scaffold

	get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'
	get 'pages/newclientregistration' => 'high_voltage/pages#show', id: 'newclientregistration'

  get 'users/adminhome'
	#get 'users/adminhome', to: 'users#adminhome'
	#get 'pages/adminhome' => 'high_voltage/pages#show', id: 'adminhome'
	get 'pages/adminclientreports' => 'high_voltage/pages#show', id: 'adminclientreports'
	get 'pages/adminmanageusers' => 'high_voltage/pages#show', id: 'adminmanageusers'
	get 'pages/adminviewmore' => 'high_voltage/pages#show', id: 'adminviewmore'

	get 'pages/counselorhome' => 'high_voltage/pages#show', id: 'counselorhome'
	get 'pages/counselorviewmore' => 'high_voltage/pages#show', id: 'counselorviewmore'
	get 'pages/searchresults' => 'high_voltage/pages#show', id: 'searchresults'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
