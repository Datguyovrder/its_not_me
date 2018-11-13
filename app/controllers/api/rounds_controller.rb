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
    game = Game.find(params[:game_id])
    if game.participations.count > 3
      @round = game.new_round
      render 'show.json.jbuilder'
    else
      render json: {errors: ["Must have at least 4 people playing"]}
    end
  end
end
