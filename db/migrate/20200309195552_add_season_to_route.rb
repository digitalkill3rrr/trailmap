class AddSeasonToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :season, :integer
  end
end
