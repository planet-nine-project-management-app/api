class Api::V1::PermissionsController < ApplicationController
        def index
            @permissions = current_user.permissions
            render json: @permissions
          end
        
          def show
            render json: @permission
          end
      
        
          private
        
          # Strong parameters for role
          def role_params
            params.require(:permission).permit(:name, :tenant_id, :user_id)
          end
end
