class Role < ApplicationRecord
  enum label: {seeker: 0, hider: 1, decoy: 2}
  belongs_to :round
  belongs_to :player
end
