class AddRouteIdToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :route_id, :integer
  end
end
