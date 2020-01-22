class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :title
      t.text :description
      t.string :difficulty
      t.string :season
      t.integer :distance
      t.string :kind

      t.timestamps
    end
  end
end
