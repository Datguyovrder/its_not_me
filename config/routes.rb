Rails.application.routes.draw do
  namespace :api do
    get "/players" => "players#index"
    post "/players" => "players#create"


    post "/sessions" => "sessions#create"
  end
end
