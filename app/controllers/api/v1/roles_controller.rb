class Api::V1::RolesController < ApplicationController
    def index
      @roles = Role.all
    end
  end
  