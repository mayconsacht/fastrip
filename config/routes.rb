Rails.application.routes.draw do

  devise_for :companies, path_names: {sign_in: 'login', sign_out: 'logout'}

  # controllers: {registrations: 'companies_registrations',
  # sessions: 'companies_sessions'}

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'},
                     controllers: {omniauth_callbacks: 'omniauth_callbacks',
                     			   registrations: 'registrations' }
  # registrations: 'users_registrations', sessions: 'users_sessions'
  devise_scope :user do
  	get 'users/logout' => 'devise/sessions#destroy'
  end

  resources :companies
  resources :trips

  root :to => 'home#index'

end
