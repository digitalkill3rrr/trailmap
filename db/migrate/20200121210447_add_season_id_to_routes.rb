class AddSeasonIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :season_id, :integer
  end
end
