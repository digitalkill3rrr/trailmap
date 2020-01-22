class RemoveSeasonFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :season, :string
  end
end
