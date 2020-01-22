class Spot < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :route

  validates :route_id, presence: true

  # def tag_list
  #   self.tags.map(&:name).join(', ')
  # end
end
