class RegistrationsController < Devise::RegistrationsController
	protected

	def after_sign_up_path_for(resource)
		if resource_name == :company
			company_path(@company)
  		elsif resource_name == :user
  			user_path(@user)
  		end
    end
end