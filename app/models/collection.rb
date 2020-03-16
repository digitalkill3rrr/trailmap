class Collection < ApplicationRecord
  has_many :routes
  has_many :spots, through: :routes

  validates :title, :description, presence: true
end
