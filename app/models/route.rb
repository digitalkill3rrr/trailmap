class Route < ApplicationRecord
  belongs_to :collection, optional: true
  has_many :spots
end
