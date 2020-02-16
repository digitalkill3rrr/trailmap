class AddUserIdToSpot < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :user_id, :integer
  end
end
