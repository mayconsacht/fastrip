class HomeController < ApplicationController

  def index
    @user = User.new
    @company = Company.new
    @contact = Contact.new
  end

end