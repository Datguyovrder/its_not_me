class Api::ParticipationsController < ApplicationController
  def index
    game = Game.find(params[:id])
    @participations = game.particiaptions
    @roles = participations.roles
    render 'index.json.jbuilder'
  end

  def create
    @participation = Participation.new(
      game_id: params[:id],
      player_id: params[:id],
      organizer: params[:id])

    if @participation.save
      render 'show.json.jbuilder'
    end
  end

  def show
    @participation = Participation.find(params[:id])
    render 'show.json.jbuilder'
  end
end
