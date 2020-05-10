class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 'активная'
      t.float :longitude
      t.float :latitude
      t.integer :route_id
      t.integer :user_id

      t.timestamps
    end
  end
end
