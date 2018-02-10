Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :notes
	root 'high_voltage/pages#show', id: 'welcome'

	devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

	resources :users
	resources :clients

	get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'

	get 'pages/adminhome' => 'high_voltage/pages#show', id: 'adminhome'
	get 'pages/adminclientreports' => 'high_voltage/pages#show', id: 'adminclientreports'
	get 'pages/adminmanageusers' => 'high_voltage/pages#show', id: 'adminmanageusers'

	get 'pages/counselorhome' => 'high_voltage/pages#show', id: 'counselorhome'
end
