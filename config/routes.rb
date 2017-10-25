Rails.application.routes.draw do

	root 'high_voltage/pages#show', id: 'welcome'

  get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
