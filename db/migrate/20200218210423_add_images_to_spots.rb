class AddImagesToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :images, :json
  end
end