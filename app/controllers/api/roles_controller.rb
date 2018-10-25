class Api::RolesController < ApplicationController
  def index
    @roles = Role.all
    render 'index.json.jbuilder'
  end

  def show
    @role = Role.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @role = Role.find(params[:id])

    @role.label = params[:label] || @recipe.label

    @role.save
    render "show.json.jbuilder"
  end
end
