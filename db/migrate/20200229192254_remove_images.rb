class RemoveImages < ActiveRecord::Migration[6.0]
  def up
    drop_table :images
  end
end
