json.array! @spots, partial: "spots/spot", as: :spot, ability: @ability, status_options: Spot.statuses.keys, signed_in: user_signed_in?
