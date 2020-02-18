class AddCoverToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :cover, :string
  end
end
