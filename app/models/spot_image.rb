class SpotImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :spot
end
