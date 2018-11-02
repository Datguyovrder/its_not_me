class Api::ParticipationsController < ApplicationController
  def index
    game = Game.find(params[:id])
    @participations = game.particiaptions
    render 'index.json.jbuilder'
  end

  def create
    @participation = Participation.new(
      game_id: params[:id],
      player_id: params[:id])

    if @participation.save
      puts "*" * 50
      puts "player.assigned_role"
      puts "*" * 50

      render json: {message: 'Participation created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @participation = Participation.find(params[:id])
    render 'show.json.jbuilder'
  end
end
