json.id game.id
json.participations do 
  json.array! game.participations, partial: 'api/participations/participation', as: :participation
end
json.game_round game.rounds
json.current_user_name current_user.name