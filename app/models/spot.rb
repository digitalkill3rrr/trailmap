class Spot < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :route
  belongs_to :user

  has_many :spot_images
  accepts_nested_attributes_for(
    :spot_images,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes[:image].blank? }
  )

  # spot_status
  enum status: [ 'активная', 'на проверке', 'неактивная' ]

  validates :route_id, :name, presence: true

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
        properties: {
          description: description,
          status: status,
          author: user&.nickname,
          image: spot_images.first&.image&.url
        }
      }
    end
end
