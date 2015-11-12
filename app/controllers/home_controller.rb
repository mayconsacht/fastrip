class HomeController < ApplicationController

  def index
  	@trip = Trip.new
    @user = User.new
    @company = Company.new
    @post = Post.new
    @user_request = UserRequest.new

    @requests = UserRequest.where("trip_out_date < ? and status = ?", Date.current, 'Confirmado')
    @requests.each do |request|
    	@requests.update(request, status: 'Realizado')
    end
  end

end