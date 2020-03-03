class Spot < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :route
  # belongs_to :user
  has_many :spot_images
  accepts_nested_attributes_for :spot_images



  validates :route_id, :name, presence: true

  # spot_status
  enum status: [ 'активная', 'на проверке', 'неактивная' ]

  # spots_for_map
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
