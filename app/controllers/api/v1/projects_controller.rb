class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    projects = current_user.projects
    render json: projects
  end

  def show
    project = current_user.projects.find(params[:id])
    render json: project
  end

  def create
    project = current_user.projects.new(project_params)
    if project.save
      render json: project, status: :created
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :status)
  end
end
