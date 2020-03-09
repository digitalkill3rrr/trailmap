class RemoveKindIdFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :kind_id, :integer
  end
end
