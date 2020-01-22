class RemoveKindFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :kind, :string
  end
end
