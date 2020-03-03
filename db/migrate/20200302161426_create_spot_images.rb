class CreateSpotImages < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_images do |t|
      t.integer :spot_id
      t.string :image

      t.timestamps
    end
  end
end
