class RemoveSeasonIdFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :season_id, :integer
  end
end
