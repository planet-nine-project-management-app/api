class Api::V1::DeliverablesController < ApplicationController
  before_action :authenticate_user!

  def index
    project = current_user.projects.find(params[:project_id])
    render json: project.deliverables
  end

  def create
    project = current_user.projects.find(params[:project_id])
    deliverable = project.deliverables.new(deliverable_params)
    if deliverable.save
      render json: deliverable, status: :created
    else
      render json: deliverable.errors, status: :unprocessable_entity
    end
  end

  private

  def deliverable_params
    params.require(:deliverable).permit(:name, :description, :due_date, :status)
  end
end
