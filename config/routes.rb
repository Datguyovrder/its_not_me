Rails.application.routes.draw do
  namespace :api do
    get "/players" => "players#index"
    post "/players" => "players#create"
    get "/players/:id" => "players#show"
    delete "/players/:id" => "players#destroy"

    #used to assign a player to a game
    get "/participations" => "participations#index"
    post "/participations" => "participations#create"
    get "/participations/:id" => "participations#show"
    
    get "/prompts" => "prompts#index"
    get "/prompts/:id" => "prompts#show" 

    get "/roles" => "roles#index"
    post "/roles" => "roles#create"
    get "/roles/:id" => "roles#show"
    
    get "/rounds" => "rounds#index"
    post "/games/:game_id/rounds" => "rounds#create" #needed to create a new round in each game
    get "/rounds/:id" => "rounds#show"
    
    #index shows all games with all players participating in them
    #show shows a specific game with all players participating in it
    get "/games" => "games#index"
    post "/games" => "games#create"
    get '/games/:id' => "games#show"
    post '/games/:id/start' => 'games#start'

    post "/sessions" => "sessions#create"
  end
end
