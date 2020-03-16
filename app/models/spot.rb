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

  # spot status
  enum status: [ 'активная', 'на проверке', 'неактивная' ]

  validates :route_id, :name, :description, :tag_list, :longitude, :latitude, :status, presence: true

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
          name: name,
          status: status,
          author: user&.nickname,
          image: spot_images.first&.image&.url
        }
      }
    end
end
