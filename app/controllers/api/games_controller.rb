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

    if @game.save
      render "show.json.jbuilder"
    end
  end
end
