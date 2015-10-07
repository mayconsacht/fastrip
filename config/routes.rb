Rails.application.routes.draw do

  devise_for :users
  resources :trips
  resources :contacts
  resources :companies
  resources :users

  root :to => 'home#index'
  get 'ops', to: 'ops#index'

  #Auth facebook
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post], as: :auth_callback
  match '/auth/failure' => 'sessions#failure', via: [:get, :post], as: :auth_failure
  match '/logout' => 'sessions#destroy', via: [:get, :post], as: :logout

  match '/404' => 'erros#404', via: [:get, :post, :create, :delete]

  get '/contact' => 'contact#index'
  get '/user' => 'users#new'
  get '/company' => 'companies#new'
  get '/sessions' => 'sessions#create'

end
