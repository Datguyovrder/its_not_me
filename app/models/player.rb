class Player < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :roles
  has_many :participations
end
