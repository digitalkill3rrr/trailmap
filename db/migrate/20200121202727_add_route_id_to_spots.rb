class AddRouteIdToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :route_id, :integer
  end
end
