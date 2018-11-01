class Role < ApplicationRecord
  belongs_to :round
  belongs_to :player
  enum label: {seeker: 1, hider: 2, decoy: 3}

  valdates :player_id, uniqueness: {scope: :round_id}
end
