Rails.application.routes.draw do

  resources :clients
	root 'high_voltage/pages#show', id: 'welcome'

  get 'pages/searchresults' => 'high_voltage/pages#show', id: 'searchresults'
  get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'
	get 'pages/adminhome' => 'high_voltage/pages#show', id: 'adminhome'
	get 'pages/newclientregistration' => 'high_voltage/pages#show', id: 'newclientregistration'
	get 'pages/login' => 'high_voltage/pages#show', id: 'login'
	get 'pages/adminclientreports' => 'high_voltage/pages#show', id: 'adminclientreports'
	get 'pages/adminmanageusers' => 'high_voltage/pages#show', id: 'adminmanageusers'
	get 'pages/adminviewmore' => 'high_voltage/pages#show', id: 'adminviewmore'
	get 'pages/counselorviewmore' => 'high_voltage/pages#show', id: 'counselorviewmore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
