class ChangeBodyToText < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :body, :text
  end
end
