class Collection < ApplicationRecord
  has_many :routes
  has_many :spots, through: :routes
  belongs_to :user

  validates :user_id, :title, :description, presence: true
end
