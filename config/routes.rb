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

  resources :companies
  resources :users
  resources :trips

  root :to => 'home#index'

end
