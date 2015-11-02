class UserRequestsController < ApplicationController
  before_action :set_user_request, only: [:show, :edit, :update, :destroy]
  layout "devise_company_application"
	def create

		@user_request = UserRequest.new
		@user_request.user_id = current_user.id
		@user_request.trip_id = params[:trip_id]
		@user_request.user_name = current_user.name
		@user_request.user_phone = current_user.phone
		@user_request.user_email = current_user.email
		@user_request.status = 'pendent'
		

		respond_to do |format|
		  if @user_request.save
		    format.html { 
		        redirect_to root_path, notice: 'Request was successfully created.' }
		  else
		    format.html { render :new }
		  end
		end
	end

	def show_requests
		@trips = Trip.where("company_id = ?", current_company.id)
	end

  private
    def set_user_request
      @user_request = UserRequest.find(params[:id])
    end

    def user_request_params
      params.require(:user_request).permit(:company_id, :trip_id, :user_name, :user_phone, :user_email, :user_message, :status)
    end
end
