class RemoveImagesFromSpots < ActiveRecord::Migration[6.0]
  def change

    remove_column :spots, :images, :json
  end
end
