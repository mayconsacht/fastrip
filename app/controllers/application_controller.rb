class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :cpf 
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :andress
    devise_parameter_sanitizer.for(:sign_up) << :cnpj
  end
  
  layout :layout_by_resource
  def layout_by_resource
   	if devise_controller?
   		
      if resource_name == :user
  			"devise_user_application"

   		elsif resource_name == :company
   			"devise_company_application"

   		else
   			"devise_application"
   		end
      
   	else
   		"application"
   	end
  end
end
