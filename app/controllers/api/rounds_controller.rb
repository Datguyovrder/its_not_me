class Api::RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    render "show.json.jbuilder"
  end
end
