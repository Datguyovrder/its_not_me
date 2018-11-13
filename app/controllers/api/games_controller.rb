class Api::GamesController < ApplicationController
  def index
    @games = Game.all
    render 'index.json.jbuilder'
  end

  def show
    @game = Game.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @game = Game.new(
                      id: params[:id],
                    )

    if @game.save && current_user
      Participation.create(player_id: current_user.id, game_id: @game.id, organizer: true)
      
      render "show.json.jbuilder"
    end
  end

  def start
    @game = Game.find(params[:id])
    @game.update(started: true)
    @game.new_round
    render 'show.json.jbuilder'
  end
end
