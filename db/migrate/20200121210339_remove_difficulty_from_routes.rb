class RemoveDifficultyFromRoutes < ActiveRecord::Migration[6.0]
  def change

    remove_column :routes, :difficulty, :string
  end
end
