class Case < ApplicationRecord
  has_many :matches
  belongs_to :public_user

  mount_uploader :image, ImageUploader
end
