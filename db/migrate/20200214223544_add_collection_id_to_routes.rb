class AddCollectionIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :collection_id, :integer
  end
end
