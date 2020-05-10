class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :cover
      t.integer :difficulty
      t.integer :season
      t.integer :distance
      t.integer :kind
      t.text :takeaway
      t.text :timetable
      t.text :warning
      t.integer :collection_id

      t.timestamps
    end
  end
end
