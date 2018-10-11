class Role < ApplicationRecord
  enum label: {seeker: 0, hider: 1, decoy: 2}
end
