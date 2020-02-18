class Route < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :collection, optional: true
  belongs_to :user
  has_many :spots

  validates :user_id, :title, presence: true
end
