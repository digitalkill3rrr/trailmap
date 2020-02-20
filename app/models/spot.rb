class Spot < ApplicationRecord
  mount_uploaders :images, ImageUploader
  acts_as_taggable_on :tags

  belongs_to :route

  validates :route_id, :name, presence: true
  enum status: [ 'активная', 'на проверке', 'неактивная' ]

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
