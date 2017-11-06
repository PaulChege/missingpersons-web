class Sighting < ApplicationRecord
  belongs_to :public_user
  has_many :matches
  mount_uploader :image, ImageUploader

end
