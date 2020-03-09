class AddDifficultyToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :difficulty, :integer
  end
end
