class Api::V1::RolesController < ApplicationController
    # before_action :set_user, only: [:index]
    # before_action :authorize_admin, only: [:assign_role]
  
    # GET /api/v1/users/:user_id/roles
    def index
      roles = current_user.roles # Fetch all roles assigned to the user
      render json: roles
    end
  
    # POST /api/v1/roles/assign
    # Admin assigns a role to a user
    # def assign_role
    #   user = User.find(role_assignment_params[:user_id])
    #   role = Role.find(role_assignment_params[:role_id])
  
    #   if user && role
    #     user.roles << role unless user.roles.include?(role)
    #     render json: { message: "Role assigned successfully", user: user, roles: user.roles }, status: :ok
    #   else
    #     render json: { error: "Invalid user or role" }, status: :unprocessable_entity
    #   end
    # end
  
    # private
  
    # Strong parameters for role assignment
    # def role_assignment_params
    #   params.require(:assignment).permit(:user_id, :role_id)
    # end
  
    # # Set user for nested roles under users
    # def set_user
    #   @user = User.find(params[:user_id])
    # rescue ActiveRecord::RecordNotFound
    #   render json: { error: "User not found" }, status: :not_found
    # end
  
    # Ensure only admins can assign roles
    # def authorize_admin
    #   unless @current_user&.admin? # Assuming `admin?` is a method to check admin status
    #     render json: { error: "Access denied" }, status: :forbidden
    #   end
    # end
  end
  