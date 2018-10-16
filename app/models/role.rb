class Role < ApplicationRecord
  belongs_to :round
  belongs_to :player
  enum label: {seeker: 1, hider: 2, decoy: 3}

  def assigned_role
    case label
    when "Seeker"
      "1"

    when "Hider"
      "2"

    when "Decoy"
      "3"

    end
  end
end
