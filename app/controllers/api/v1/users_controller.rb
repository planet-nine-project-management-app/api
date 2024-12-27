class Api::V1::UsersController < ApplicationController
  
      def update
        @user = User.find(params[:id])
        @user.update!(user_params)
      end
    
      private
    
      def user_params
        params.require(:user).permit(:email, :password, :name, :role, :tenant_id, 
          :profile_picture, # For Active Storage
          image_attributes: [:id, :file_name, :byte_size, :file_type, :_destroy]) # Nested attributes
      end
end
