Rails.application.routes.draw do
  namespace :api do
    get "/players" => "players#index"
    post "/players" => "players#create"
    get "/players/:id" => "players#show"
    delete "/players/:id" => "players#destroy"

    get "/participations" => "participations#index"
    post "/participations" => "participations#create"
    get "/participations/:id" => "participations#show"

    get "/roles" => "roles#index"

    get "/rounds/:id" => "rounds#show"

    get "/games" => "games#index"
    get "/games/:id" => "games#show"

    post "/sessions" => "sessions#create"
  end
end
