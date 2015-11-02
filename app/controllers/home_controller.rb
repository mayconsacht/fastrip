class HomeController < ApplicationController

  def index
  	@trip = Trip.new
    @user = User.new
    @company = Company.new
    @post = Post.new
    @user_request = UserRequest.new
  end

end