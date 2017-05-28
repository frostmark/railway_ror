class AddOrderToRoutesStations < ActiveRecord::Migration[5.1]
  def change
    add_column :routes_stations, :order, :integer

    add_index :routes_stations, [:station_id, :order], unique: true
  end
end
