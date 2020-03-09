class RemoveDifficultyIdFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :difficulty_id, :integer
  end
end
