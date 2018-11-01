class Game < ApplicationRecord
  has_many :rounds
  has_many :roles, through: :rounds
  has_many :participations
  has_many :players, through: :participations

  def new_round
    possible_roles = ["seeker","hider","decoy","decoy"].shuffle!
    # last_roles = rounds.last.roles if rounds.any? #this could lead to not repeating the last roles
    round = Round.create(game_id: id, prompt_id: Prompt.all.sample.id)
    players.each_with_index do |player, index|
      Role.create(player_id: player.id, label: possible_roles[index])
    end
  end
end
