class Api::ParticipationsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    @participations = Participation.all
    render 'index.json.jbuilder'
  end

  def create
    @participation = Participation.new(
                                        player_id: current_user.id,
                                        game_id: params[:game_id],
                                        organizer: false
                                      )



    if @participation.save
      render 'show.json.jbuilder'
    end
  end

  def show
    @participation = Participation.find(params[:id])
    render 'show.json.jbuilder'
  end
end
