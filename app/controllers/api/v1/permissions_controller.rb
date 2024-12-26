class Api::V1::PermissionsController < ApplicationController
  def index
      @permissions = Permission.all
    end
end
