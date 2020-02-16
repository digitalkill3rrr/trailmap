class Route < ApplicationRecord
  belongs_to :collection, optional: true
  belongs_to :user
  has_many :spots

  validates :user_id, :title, presence: true
end
