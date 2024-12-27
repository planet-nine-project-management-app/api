class Api::V1::CompaniesController < ApplicationController
    before_action :find_company, only: [:show, :destroy, :update]

    def index
      @companies = Company.all
    end
  
    def show
    end
  
    def create
      @company = Company.create!(company_params)
    end

    def destroy
        @company.destroy!
    end

    def update
        @company.update!(company_params)
    end

    private

    def company_params
        params.require(:company).permit(:name, :tenant_id, :description, :logo_url, :theme)
    end

    def find_company
        @company = Company.find(params[:id])
    end
    
end
