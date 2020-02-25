class AddSpotIdToImage < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :spot_id, :integer
  end
end
