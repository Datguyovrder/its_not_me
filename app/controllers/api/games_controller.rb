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
      render json: {message: 'Participation created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
