class AddInfoToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :takeaway, :text
    add_column :routes, :timetable, :text
    add_column :routes, :warning, :text
  end
end
