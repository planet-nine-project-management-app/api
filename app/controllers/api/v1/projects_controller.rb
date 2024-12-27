class Api::V1::ProjectsController < ApplicationController
  before_action :set_company

  def index
    @projects = @company.projects
  end

  def show
    @project = @company.projects.find(params[:id])
  end

  def create
    @project = @company.projects.create!(project_params)
  end

  def destroy
    @company.projects.find(params[:id]).destroy!
  end

  def update
    @company.projects.find(params[:id]).update!(project_params)
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def project_params
    params.require(:project).permit(:name, :tenant_id, :description, :start_date, :end_date, :status, 
      attachments: [], # For Active Storage
      images_attributes: [:id, :file_name, :byte_size, :file_type, :_destroy]) # Nested attributes
  end
end
