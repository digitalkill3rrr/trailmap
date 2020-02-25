class ChangeDistanceToIntegerInRoutes < ActiveRecord::Migration[6.0]
  def change
    change_column :routes, :distance, :integer
  end
end
