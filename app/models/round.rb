class Round < ApplicationRecord
  belongs_to :prompt
  belongs_to :game
  has_many :roles
  has_many :players, through: :roles


  def find_role_by_player_id(player_id)
    roles.find_by(player_id: player_id).label if roles.find_by(player_id: player_id)
  end
end
