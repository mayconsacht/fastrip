Rails.application.routes.draw do

  devise_for :companies, path_names: {sign_in: 'login', sign_out: 'logout'},
                     	 controllers: {registrations: 'registrations',
                     			      sessions: 'sessions'}

  devise_for :users, path_names: {sign_in: 'login', 
                                  sign_out: 'logout'},
        controllers: {omniauth_callbacks: 'omniauth_callbacks',
        registrations: 'registrations',sessions: 'sessions'}

  devise_scope :user do
  	get 'users/logout' => 'devise/sessions#destroy'
  end

  devise_scope :company do
  	get 'companies/logout' => 'devise/sessions#destroy'

  end

  root :to => 'home#index'

  post 'detail_company', controller: 'companies', action: 'detail_company'

  post 'user_request', controller: 'user_requests', action: 'create'
  get 'show_requests', controller: 'user_requests', action: 'show_requests'
  get 'approve_request', controller: 'user_requests', action: 'approve_request'
  get 'reject_request', controller: 'user_requests', action: 'reject_request'
  
  get 'get_attributes_post', controller: 'users', action: 'get_attributes_post'
  resources :companies
  resources :users
  resources :trips
  resources :posts

end
