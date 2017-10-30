class Match < ApplicationRecord
  belongs_to :case
  belongs_to :sighting
end
