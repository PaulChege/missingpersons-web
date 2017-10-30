class Case < ApplicationRecord
  has_many :matches
  has_many :sightings
  belongs_to :public_user
end
