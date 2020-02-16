class AddUserIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :user_id, :integer
  end
end
