class Api::V1::UsersController < ApplicationController
  
      def update
        @user = User.find(params[:id])
        @user.update!(user_params)
      end
    
      private
    
      def user_params
        params.require(:user).permit(:email, :password, :name, :role, :tenant_id)
      end
end
