class RenameOrderToPositionRoutesStations < ActiveRecord::Migration[5.1]
  def change
    rename_column :routes_stations, :order, :position
  end
end
