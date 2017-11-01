Rails.application.routes.draw do

	root 'high_voltage/pages#show', id: 'welcome'

  get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'
	get 'pages/adminhome' => 'high_voltage/pages#show', id: 'adminhome'
	get 'pages/newclientregistration' => 'high_voltage/pages#show', id: 'newclientregistration'
	get 'pages/login' => 'high_voltage/pages#show', id: 'login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
