Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	root 'high_voltage/pages#show', id: 'welcome'

	devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

	resources :users
	resources :clients
  resources :notes
  resources :session_rating_forms

  match '/notes' => 'notes#update', via: :put, as: 'update_notes'

  get '/clients/:id/notes' => 'clients#notes', as: 'client_notes_path'
  get '/clients/:id/confirm_archive' => 'clients#confirm_archive', as: 'client_archive_path'

	get 'pages/welcome' => 'high_voltage/pages#show', id: 'welcome'

	get 'admin/adminhome' => 'admin#adminhome', id: 'adminhome'
	get 'admin/adminclientreports' => 'admin#adminclientreports', id: 'adminclientreports'
	get 'admin/adminmanageusers' => 'admin#adminmanageusers', id: 'adminmanageusers'
  get 'admin/submittednotes' => 'admin#submittednotes', id: 'submittednotes'

	get 'pages/counselorhome' => 'high_voltage/pages#show', id: 'counselorhome'

  resources :clients do
    resources :versions, only: [:destroy] do
      member do
        get :diff, to: 'versions#diff'
        patch :rollback, to: 'versions#rollback'
      end
    end
  end
end
