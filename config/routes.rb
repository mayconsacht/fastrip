Rails.application.routes.draw do

  devise_for :companies
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'},
                     controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  devise_scope :user do
  	get 'users/logout' => 'devise/sessions#destroy'
  end

  resources :companies
  resources :trips

  root :to => 'home#index'

end
