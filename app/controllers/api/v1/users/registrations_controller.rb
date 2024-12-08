class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  def create
    build_resource(sign_up_params)

    if resource.save!
      @user = resource
      @token = resource.generate_jwt
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end