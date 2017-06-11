class AddArriveDepartureTimeToRoutesStations < ActiveRecord::Migration[5.1]
  def change
    add_column :routes_stations, :arrive_time, :time
    add_column :routes_stations, :departure_time, :time
  end
end
