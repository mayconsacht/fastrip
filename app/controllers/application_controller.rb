class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :cpf
    devise_parameter_sanitizer.for(:sign_up) << :points 
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :andress
    devise_parameter_sanitizer.for(:sign_up) << :cnpj
    devise_parameter_sanitizer.for(:sign_up) << :email
    devise_parameter_sanitizer.for(:sign_up) << :password
    devise_parameter_sanitizer.for(:sign_up) << :uid
    devise_parameter_sanitizer.for(:sign_up) << :provider
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:sign_up) << :oauth_token
    devise_parameter_sanitizer.for(:sign_up) << :token_secret
  end
  
  layout :layout_by_resource
  def layout_by_resource
   	if devise_controller?
   		
      if resource_name == :user or resource_name == :company
  			"devise_user_application"

   		elsif resource_name == :company
   			"devise_company_application"

   		end
      
   	else
   		"application"
   	end
  end

  def new_session_path(scope)
    new_user_session_path
  end
  
end
