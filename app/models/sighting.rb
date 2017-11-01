class Sighting < ApplicationRecord
  belongs_to :public_user
  has_many :matches
end
