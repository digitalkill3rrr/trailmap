json.extract! route, :id, :title, :description, :difficulty, :season, :distance, :kind, :created_at, :updated_at
json.url route_url(route, format: :json)
