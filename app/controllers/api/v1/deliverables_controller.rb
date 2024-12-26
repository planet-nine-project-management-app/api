class Api::V1::DeliverablesController < ApplicationController
    before_action :find_project, only: [:create]

    def index
      @deliverables = Deliverable.joins(project: :company)
      .select('deliverables.*, projects.name AS project_name, companies.name AS company_name')
      .where(user_id: current_user.id)
    end

    def create
      @deliverable = @project.deliverables.create!(deliverable_params)
    end

    def destroy
      @deliverable.destroy!
    end

    def update
      @deliverable.update!(deliverable_params)
    end

    private

    def find_project
      @project = current_user.projects.find(params[:project_id])
    end

    def deliverable_params
      params.require(:deliverable).permit(:name,:tenant_id, :user_id, :description, :due_date, :status)
    end
end
