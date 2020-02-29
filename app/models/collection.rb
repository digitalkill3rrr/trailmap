class Collection < ApplicationRecord
  acts_as_taggable_on :tags

  has_many :routes
  has_many :spots, through: :routes
end
