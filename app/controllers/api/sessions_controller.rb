class Api::SessionsController < ApplicationController
  def create
    player = Player.find_by(email: params[:email])
    if player && player.authenticate(params[:password])
      jwt = JWT.encode(
        {
         player_id: player.id, # the data to encode
         exp: 1000.hours.from_now.to_i # the expiration time
         },
         Rails.application.credentials.fetch(:secret_key_base), # the secret key
         'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: player.email, player_id: player.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
