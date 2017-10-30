class PublicUser < ApplicationRecord
  has_many :cases
  has_many :sightings
  has_secure_password
end
