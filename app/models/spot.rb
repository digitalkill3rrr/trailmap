class Spot < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :route

  validates :route_id, presence: true

end
