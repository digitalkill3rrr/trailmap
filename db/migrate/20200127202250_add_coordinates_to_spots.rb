class AddCoordinatesToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :longitude, :float
    add_column :spots, :latitude, :float
  end
end
