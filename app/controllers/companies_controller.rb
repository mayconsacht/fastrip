class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy, :company_home]
  layout "devise_company_application"
  
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to :action => "show", :id => @compani.id, notice: 'Company was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to :action => "show", :id => @compani.id, notice: 'Company was successfully updated.' }
      else
        format.html { render :edit }
      end
      redirect_to action: show
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:id, :points, :name, :email, :cnpj, :phone, :andress, :password, :access_token)
    end
end
