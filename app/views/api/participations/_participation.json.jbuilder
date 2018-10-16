json.id participation.id
json.player_id participation.id
json.game_id participation.game_id
json.labels do
  json.array! participation.player.roles
end