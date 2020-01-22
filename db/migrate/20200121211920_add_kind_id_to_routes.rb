class AddKindIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :kind_id, :integer
  end
end
