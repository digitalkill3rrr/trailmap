class Spot < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :route

  validates :route_id, :user_id, :name, presence: true

  def coordinates
    [latitude, longitude]
  end

  def to_map_point
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: coordinates
      },
      properties: {}
    }
  end

end
