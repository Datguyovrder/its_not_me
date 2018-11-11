json.id participation.id
json.player do 
  json.partial! participation.player, partial: 'api/players/player', as: :player
end
json.game_id participation.game_id
json.organizer participation.organizer