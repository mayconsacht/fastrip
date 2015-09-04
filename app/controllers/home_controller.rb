class HomeController < ApplicationController

  def index
    @user = User.new
    @company = Company.new
  end

end