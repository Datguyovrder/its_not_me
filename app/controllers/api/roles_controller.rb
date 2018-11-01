class Api::RolesController < ApplicationController
  def index
    @roles = Role.all
    render 'index.json.jbuilder'
  end

  def show
    @role = Role.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @role = Role.new(
      round_id: params[:id],
      player_id: params[:id],
      label: params[:id])

    if @role.save
      render json: {message: 'Role created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
