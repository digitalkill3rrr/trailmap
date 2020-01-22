class AddDifficultyIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :difficulty_id, :integer
  end
end
