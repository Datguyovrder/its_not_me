json.id game.id
json.participations do 
  json.array! game.participations, partial: 'api/participations/participation', as: :participation
end
json.game_round do
  json.array! game.rounds, partial: 'api/rounds/round', as: :round
end
json.current_round_id game.current_round_id
json.current_user_id current_user.id
json.organizer_id game.organizer_id
json.started game.started