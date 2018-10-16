class Api::PlayersController < ApplicationController
  def index
    @players = Player.all
    render 'index.json.jbuilder'
  end

  def create
    @player = Player.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @player.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @player = Player.find(params[:id])
    render 'show.json.jbuilder'
  end

  
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    render json: {message: "Recipe successfully destroyed"}
  end
end
