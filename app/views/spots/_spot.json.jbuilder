json.extract! spot, :id, :name, :description, :status, :latitude, :longitude, :tag_list, :route_id, :errors
json.user spot.user.nickname
json.images do
  json.array! spot.spot_images do |image|
    json.id image.id
    json.src image.image_url
  end
end
json.status_options status_options
json.manage ability.can?(:manage, spot)
