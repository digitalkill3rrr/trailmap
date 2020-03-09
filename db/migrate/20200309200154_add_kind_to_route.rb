class AddKindToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :kind, :integer
  end
end
