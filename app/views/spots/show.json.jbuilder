json.partial! "spots/spot", spot: @spot, ability: @ability, status_options: Spot.statuses.keys, signed_in: user_signed_in?
