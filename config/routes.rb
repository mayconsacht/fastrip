Rails.application.routes.draw do

  devise_for :companies, path_names: {sign_in: 'login', sign_out: 'logout'},
                     	 controllers: {registrations: 'registrations',
                     			      sessions: 'sessions'}

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'},
                     controllers: {omniauth_callbacks: 'omniauth_callbacks',
                     			   registrations: 'registrations',
                     			   sessions: 'sessions'}

  devise_scope :user do
  	get 'users/logout' => 'devise/sessions#destroy'
  end

  devise_scope :company do
  	get 'companies/logout' => 'devise/sessions#destroy'

  end

  root :to => 'home#index'

  post 'user_request', controller: 'user_requests', action: 'create'

  get 'show_requests', controller: 'user_requests', action: 'show_requests'

  resources :companies
  resources :users
  resources :trips

end
