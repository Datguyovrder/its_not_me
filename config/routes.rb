Rails.application.routes.draw do
  namespace :api do
    get "/players" => "players#index"
    post "/players" => "players#create"
    get "/players/:id" => "players#show"

    get "/roles" => "roles#index"

    get "/games" => "games#index"
    get "/games/:id" => "games#show"

    post "/sessions" => "sessions#create"
  end
end
