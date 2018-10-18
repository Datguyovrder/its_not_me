class Api::RoundsController < ApplicationController
  def index
    @rounds = Round.all
    render "index.json.jbuilder"
  end

  def show
    @round = Round.find(params[:id])
    render "show.json.jbuilder"
  end
end
