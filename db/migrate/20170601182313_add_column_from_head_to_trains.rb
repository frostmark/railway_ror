class AddColumnFromHeadToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :from_head, :boolean, default: false
  end
end
