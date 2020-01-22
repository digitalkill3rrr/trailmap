class AddDistanceToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :distance, :string
  end
end
