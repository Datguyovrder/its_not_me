class Round < ApplicationRecord
  belongs_to :prompt
  belongs_to :game
  has_many :roles
  has_many :players, through: :roles
end
