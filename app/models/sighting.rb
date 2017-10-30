class Sighting < ApplicationRecord
  belongs_to :case
  belongs_to :public_user
  has_many :matches
end
