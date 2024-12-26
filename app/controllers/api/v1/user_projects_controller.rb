class Api::V1::UserProjectsController < ApplicationController
    def index
        @user_projects = UserProject.all
        render json: @user_projects
      end
    
      def show
        @user_project = UserProject.find(params[:id])
        render json: @user_project
      end
    
      def create
        @user_project = UserProject.new(user_project_params)
        if @user_project.save
          render json: @user_project, status: :created
        else
          render json: @user_project.errors, status: :unprocessable_entity
        end
      end
    
      def update
        @user_project = UserProject.find(params[:id])
        if @user_project.update(user_project_params)
          render json: @user_project
        else
          render json: @user_project.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @user_project = UserProject.find(params[:id])
        if @user_project.destroy
          head :no_content
        else
          render json: @user_project.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def user_project_params
        params.require(:user_project).permit(:user_id, :project_id, :tenant_id, :role_in_project)
      end
end
