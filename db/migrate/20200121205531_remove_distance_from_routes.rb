class RemoveDistanceFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :distance, :integer
  end
end
