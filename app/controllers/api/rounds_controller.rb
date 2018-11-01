class Api::RoundsController < ApplicationController
  def index
    @rounds = Round.all
    render "index.json.jbuilder"
  end

  def show
    @round = Round.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    @round = Round.new(
      game_id: params[:id],
      prompt_id: params[:id])

    if @round.save
      render json: {message: 'Round created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
