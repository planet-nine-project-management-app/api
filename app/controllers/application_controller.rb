class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authenticate_user!, :set_default_format

  def authenticate_user!
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded = JWT.decode(token, ENV['SECRET_KEY_BASE'])[0]
    @current_user = User.find(decoded['id'])

    raise ExceptionHandler::InvalidAccess, "Invalid token" if @current_user.jti != decoded['jti']
  end

  private

  def set_default_format
    request.format = :json
  end
end
