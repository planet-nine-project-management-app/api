class Api::V1::DeliverablesController < ApplicationController
  before_action :find_project, only: [:index, :create]

  def index
  end

  def create
    @deliverable = @project.deliverables.create!(deliverable_params)
  end

  private

  def find_project
    @project = current_user.projects.find(params[:project_id])
  end

  def deliverable_params
    params.require(:deliverable).permit(:name,:tenant_id, :user_id, :project_id, :description, :due_date, :status)
  end
end
