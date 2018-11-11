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
    people_count = game.participations.count 

    if people_count > 3

      prompt_id = Prompt.all.sample.id
      current_game_rounds = game.rounds.count

      @round = Round.new(
                          game_id: params[:game_id],
                          prompt_id: prompt_id,
                          game_round: current_game_rounds + 1
                          )

      labels = ["hider", "seeker"]

      (people_count - 2).times do 
        labels << "decoy"
      end

      labels.shuffle!

      game.players.each_with_index do |player, index|
        Role.create(player_id: player.id, round_id: @round.id, label: labels[index])
      end

      if @round.save
        render 'show.json.jbuilder'
      end

    else
      render json: {errors: ["Must have at least 4 people playing"]}
    end
  end

end
