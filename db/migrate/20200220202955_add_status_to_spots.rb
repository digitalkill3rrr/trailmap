class AddStatusToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :status, :integer, default: 'активная'
  end
end
