class Spot < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :route

  validates :route_id, :user_id, :name, presence: true

end
