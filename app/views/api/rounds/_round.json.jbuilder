json.id round.id
json.game_id round.game_id
json.game_round round.game_round
json.prompt_message round.prompt.message

json.current_player_id current_user.id

json.participations do 
  json.array! round.game.participations.each do |participation|
    json.id participation.id
    json.player do 
      json.partial! participation.player, partial: 'api/players/player', as: :player
    end
    json.game_id participation.game_id
    json.organizer participation.organizer
    json.role round.find_role_by_player_id(participation.player_id)
  end
end
