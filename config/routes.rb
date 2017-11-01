Rails.application.routes.draw do

	root 'high_voltage/pages#show', id: 'welcome'

  get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'
	get 'pages/adminhome' => 'high_voltage/pages#show', id: 'adminhome'
	get 'pages/newclientregistration' => 'high_voltage/pages#show', id: 'newclientregistration'
	get 'pages/login' => 'high_voltage/pages#show', id: 'login'
	get 'pages/adminviewclients' => 'high_voltage/pages#show', id: 'adminviewclients'
	get 'pages/adminclientreports' => 'high_voltage/pages#show', id: 'adminclientreports'
	get 'pages/adminmanageusers' => 'high_voltage/pages#show', id: 'adminmanageusers'
	get 'pages/viewmore' => 'high_voltage/pages#show', id: 'viewmore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
