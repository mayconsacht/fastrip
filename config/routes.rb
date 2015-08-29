Rails.application.routes.draw do

  root :to => 'home#index'
  get 'ops', to: 'ops#index'

  #Auth facebook routes
  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post], as: :auth_callback
  match "/auth/failure" => "sessions#failure", via: [:get, :post], as: :auth_failure
  match "/logout" => "sessions#destroy", via: [:get, :post], as: :logout

  
end
