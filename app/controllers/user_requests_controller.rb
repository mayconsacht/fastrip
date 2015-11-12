class UserRequestsController < ApplicationController
  	before_action :set_user_request, only: [:show, :edit, :update, :destroy]
  	layout "devise_company_application"

	def create
		if UserRequest.where('user_id = ? and trip_id = ?', current_user.id, params[:trip_id]).count <= 0

			@user_request = UserRequest.new
			@user_request.user_id = current_user.id
			@user_request.trip_id = params[:trip_id]			
			@user_request.user_name = current_user.name
			@user_request.user_phone = current_user.phone
			@user_request.user_email = current_user.email
			@user_request.trip_out_date = params[:out_date]
			@user_request.status = 'Pendente'

			respond_to do |format|
		      if @user_request.save
		        format.js
		      end
		    end
		elsif 
			redirect_to root_path
		end
			
	end

	def show_requests
		@trips = Trip.where("company_id = ?", current_company.id)
	end

	def approve_request
		@trips = Trip.where("company_id = ?", current_company.id)
		UserRequest.update(params[:id], status: 'Confirmado')
		respond_to do |format|
			format.js
		end
	end

	def reject_request
		@trips = Trip.where("company_id = ?", current_company.id)
		UserRequest.update(params[:id], status: 'Recusado')
		respond_to do |format|
			format.js
		end
	end

	private
	def set_user_request
    	@user_request = UserRequest.find(params[:id])
    end

    def user_request_params
     	params.require(:user_request).permit(:id, :company_id, :trip_id, :out_date, :user_name, :user_phone, :user_email, :user_message, :status)
   	end
end
