class Api::V1::Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: [:create]

  # User login
  def create
    @user = User.find_by!(email: sign_in_params[:email])

    @token = @user.generate_jwt if @user.valid_password?(sign_in_params[:password])
  end
  
  # User logout
  def sign_out
    @current_user.invalidate_jwt!
  end

  private

  # Strong parameters for login
  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end