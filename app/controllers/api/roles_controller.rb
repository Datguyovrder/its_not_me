class Api::RolesController < ApplicationController
  def index
    @roles = Role.all
    render 'index.json.jbuilder'
  end
end
