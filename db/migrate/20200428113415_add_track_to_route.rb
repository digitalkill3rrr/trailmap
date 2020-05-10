class AddTrackToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :track, :string
  end
end
